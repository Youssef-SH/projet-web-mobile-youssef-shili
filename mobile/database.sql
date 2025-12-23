-- ============================================================
-- ISIMM ClubHub — Schéma PostgreSQL (final)
-- RBAC + Présidence/Vice-Présidence + Événements + Communauté
-- ============================================================

-- Extensions
CREATE EXTENSION IF NOT EXISTS pgcrypto; -- gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS btree_gist; -- exclusion constraints

-- ======================
-- Types (ENUM)
-- ======================
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'role_systeme') THEN
    CREATE TYPE role_systeme AS ENUM ('Etudiant', 'ClubOfficer', 'Administrateur');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'role_club') THEN
    CREATE TYPE role_club AS ENUM ('President', 'VicePresident');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'statut_demande') THEN
    CREATE TYPE statut_demande AS ENUM ('EnAttente', 'Approuvee', 'Rejetee');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'type_notification') THEN
    CREATE TYPE type_notification AS ENUM ('Info', 'Approbation', 'Rappel');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'origine_equipement') THEN
    CREATE TYPE origine_equipement AS ENUM ('Interne', 'Externe');
  END IF;
END$$;

-- ======================
-- Auth / Utilisateurs
-- ======================
CREATE TABLE IF NOT EXISTS utilisateur (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nom TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  mot_de_passe TEXT NOT NULL, -- hash
  role role_systeme NOT NULL, -- Etudiant | ClubOfficer | Administrateur
  date_creation TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Sessions (refresh tokens / device sessions)
CREATE TABLE IF NOT EXISTS session (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_utilisateur UUID NOT NULL REFERENCES utilisateur(id) ON DELETE CASCADE,
  refresh_token TEXT NOT NULL,
  user_agent TEXT,
  ip TEXT,
  expire_le TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Password reset flow
CREATE TABLE IF NOT EXISTS password_reset_token (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_utilisateur UUID NOT NULL REFERENCES utilisateur(id) ON DELETE CASCADE,
  token TEXT NOT NULL UNIQUE,
  expire_le TIMESTAMPTZ NOT NULL,
  used BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ======================
-- Clubs & Leadership RBAC (President / VP)
-- ======================
CREATE TABLE IF NOT EXISTS club (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nom TEXT NOT NULL,
  description TEXT,
  logo_url TEXT,
  -- Optionnel : si vous avez un "compte club" dédié (sinon laisser NULL)
  id_utilisateur UUID UNIQUE REFERENCES utilisateur(id) ON DELETE SET NULL
);

-- Responsables (President / VicePresident) : level-2 RBAC par club
CREATE TABLE IF NOT EXISTS club_responsable (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_utilisateur UUID NOT NULL REFERENCES utilisateur(id) ON DELETE CASCADE,
  id_club UUID NOT NULL REFERENCES club(id) ON DELETE CASCADE,
  role role_club NOT NULL, -- President | VicePresident
  -- name
  -- niveau d'etude
  cin VARCHAR(20),
  telephone VARCHAR(20),
  email TEXT,

  UNIQUE (id_club, role), -- 1 président + 1 vice-président par club
  UNIQUE (id_utilisateur, id_club) -- un user ne peut pas occuper 2 rôles dans le même club
);

-- Abonnements (follow)
CREATE TABLE IF NOT EXISTS abonnement (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_utilisateur UUID NOT NULL REFERENCES utilisateur(id) ON DELETE CASCADE,
  id_club UUID NOT NULL REFERENCES club(id) ON DELETE CASCADE,
  date_creation TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (id_utilisateur, id_club)
);

-- ======================
-- Salles
-- ======================
CREATE TABLE IF NOT EXISTS lieu_event (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nom TEXT NOT NULL,
  capacite INT,
  localisation TEXT
);

-- ======================
-- Demandes d'événement (workflow admin)
-- ======================
CREATE TABLE IF NOT EXISTS demande_evenement (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_club UUID NOT NULL REFERENCES club(id) ON DELETE CASCADE,
  id_responsable UUID NOT NULL REFERENCES club_responsable(id) ON DELETE RESTRICT,
  --type event (enum)
  -- lieu event
  date_debut TIMESTAMPTZ NOT NULL,
  date_fin TIMESTAMPTZ NOT NULL,
  -- nbr_etud
  statut statut_demande NOT NULL DEFAULT 'EnAttente',
  commentaire_admin TEXT,
  date_soumission TIMESTAMPTZ NOT NULL DEFAULT now(),

  CHECK (date_fin > date_debut)
);

-- ======================
-- Événements publiés (depuis une demande approuvée)
-- ======================
CREATE TABLE IF NOT EXISTS evenement (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_demande UUID UNIQUE REFERENCES demande_evenement(id) ON DELETE CASCADE,
  id_salle UUID NOT NULL REFERENCES salle(id) ON DELETE RESTRICT,
  titre TEXT NOT NULL,
  description TEXT,
  date_debut TIMESTAMPTZ NOT NULL,
  date_fin TIMESTAMPTZ NOT NULL,
  publie BOOLEAN NOT NULL DEFAULT true, --wtffffff 
  tranche tstzrange GENERATED ALWAYS AS (tstzrange(date_debut, date_fin, '[)')) STORED,
  CHECK (date_fin > date_debut)
);

-- Empêche le double-booking de salle (overlap temporel)
ALTER TABLE evenement
  ADD CONSTRAINT IF NOT EXISTS evenement_no_overlap
  EXCLUDE USING gist (id_salle WITH =, tranche WITH &&);

CREATE INDEX IF NOT EXISTS idx_evenement_dates ON evenement(date_debut, date_fin);
CREATE INDEX IF NOT EXISTS idx_demande_statut ON demande_evenement(statut);
CREATE INDEX IF NOT EXISTS idx_demande_club_date ON demande_evenement(id_club, date_soumission DESC);

-- ======================
-- Annexes administratives (dérivées du dossier papier)
-- ======================
CREATE TABLE IF NOT EXISTS equipement (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_demande UUID NOT NULL REFERENCES demande_evenement(id) ON DELETE CASCADE,
  nom TEXT NOT NULL,
  type TEXT,
  quantite INT,
  origine origine_equipement NOT NULL, -- Interne / Externe
  source TEXT
);

CREATE TABLE IF NOT EXISTS partenaire (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_demande UUID NOT NULL REFERENCES demande_evenement(id) ON DELETE CASCADE,
  nom TEXT NOT NULL,
  type TEXT, -- libre, sinon faire ENUM interne/externe
  email TEXT,
  telephone TEXT
);

CREATE TABLE IF NOT EXISTS budget_ligne (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_demande UUID NOT NULL REFERENCES demande_evenement(id) ON DELETE CASCADE,
  description_depense TEXT NOT NULL,
  montant_demande NUMERIC(10,2),
  montant_accorde NUMERIC(10,2),
  remarques TEXT
);

CREATE TABLE IF NOT EXISTS membre_organisation (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_demande UUID NOT NULL REFERENCES demande_evenement(id) ON DELETE CASCADE,
  nom TEXT NOT NULL,
  niveau TEXT,
  departement TEXT,
  telephone TEXT,
  fonction TEXT
);

CREATE TABLE IF NOT EXISTS engagement (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_demande UUID NOT NULL REFERENCES demande_evenement(id) ON DELETE CASCADE,
  signe_par TEXT NOT NULL,
  date_signature DATE NOT NULL DEFAULT CURRENT_DATE,
  contenu TEXT,
  signature_electronique TEXT -- S3 key / data URL
);

CREATE TABLE IF NOT EXISTS autorisation (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_demande UUID NOT NULL REFERENCES demande_evenement(id) ON DELETE CASCADE,
  decision statut_demande NOT NULL,
  commentaire TEXT,
  date_decision TIMESTAMPTZ NOT NULL DEFAULT now(),
  valide_par TEXT NOT NULL,
  signature_electronique TEXT
);

-- ======================
-- Wall / Publications & Médias
-- ======================
CREATE TABLE IF NOT EXISTS publication (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_club UUID NOT NULL REFERENCES club(id) ON DELETE CASCADE,
  id_utilisateur UUID NOT NULL REFERENCES utilisateur(id) ON DELETE RESTRICT,
  contenu TEXT NOT NULL,
  media_url TEXT,
  date_creation TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_publication_club_date ON publication(id_club, date_creation DESC);

CREATE TABLE IF NOT EXISTS media (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  owner_type TEXT NOT NULL, -- 'publication' | 'demande' | 'evenement' ...
  owner_id UUID NOT NULL, -- FK logique côté application
  s3_key TEXT NOT NULL,
  mime_type TEXT,
  size_bytes INT,
  date_upload TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ======================
-- QR Attendance & Feedback
-- ======================
CREATE TABLE IF NOT EXISTS qr_token (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_evenement UUID NOT NULL REFERENCES evenement(id) ON DELETE CASCADE,
  token TEXT NOT NULL,
  expire_le TIMESTAMPTZ NOT NULL,
  UNIQUE (id_evenement, token)
);

CREATE TABLE IF NOT EXISTS presence (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_evenement UUID NOT NULL REFERENCES evenement(id) ON DELETE CASCADE,
  id_utilisateur UUID NOT NULL REFERENCES utilisateur(id) ON DELETE CASCADE,
  horodatage TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (id_evenement, id_utilisateur)
);

CREATE TABLE IF NOT EXISTS feedback_form (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_evenement UUID UNIQUE NOT NULL REFERENCES evenement(id) ON DELETE CASCADE,
  lien_formulaire TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS feedback_import (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_evenement UUID UNIQUE NOT NULL REFERENCES evenement(id) ON DELETE CASCADE,
  resume JSONB,
  importe_le TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ======================
-- Notifications & Outbox
-- ======================
CREATE TABLE IF NOT EXISTS notification (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_utilisateur UUID NOT NULL REFERENCES utilisateur(id) ON DELETE CASCADE,
  type type_notification NOT NULL,
  message TEXT NOT NULL,
  lu BOOLEAN NOT NULL DEFAULT false,
  date_creation TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_notification_user_date ON notification(id_utilisateur, date_creation DESC);

CREATE TABLE IF NOT EXISTS outbox (
  id BIGSERIAL PRIMARY KEY,
  topic TEXT NOT NULL, -- 'email' | 'push'
  payload JSONB NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  processed_at TIMESTAMPTZ
);

-- ======================
-- Journal / Audit (optionnel mais conseillé)
-- ======================
CREATE TABLE IF NOT EXISTS journal_action (
  id BIGSERIAL PRIMARY KEY,
  id_utilisateur UUID REFERENCES utilisateur(id) ON DELETE SET NULL,
  objet_type TEXT NOT NULL, -- 'demande','evenement','club','publication', etc.
  objet_id UUID NOT NULL,
  action TEXT NOT NULL, -- 'create','update','approve','reject','delete',...
  details JSONB,
  cree_le TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ======================
-- Recommandations d’index (déjà partiellement ajoutés plus haut)
-- ======================
CREATE INDEX IF NOT EXISTS idx_demande_dates ON demande_evenement(date_debut, date_fin);
CREATE INDEX IF NOT EXISTS idx_evenement_salle_date ON evenement(id_salle, date_debut);
CREATE INDEX IF NOT EXISTS idx_presence_event_user ON presence(id_evenement, id_utilisateur);
CREATE INDEX IF NOT EXISTS idx_pub_user_date ON publication(id_utilisateur, date_creation DESC);