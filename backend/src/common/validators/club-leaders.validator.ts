import { normalizeEmail } from 'src/common/utils/strings.util';
import { validationError } from 'src/common/utils/fail.util';
import { ClubRole } from 'src/common/enums/club-role.enum';

export type ClubLeaderInvariantInput = {
  role: ClubRole;
  email: string;
  cin: string;
};

export function validateClubLeadersInvariant(
  leaders: ReadonlyArray<ClubLeaderInvariantInput>,
) {
  if (!Array.isArray(leaders) || leaders.length !== 2) {
    validationError('Exactly 2 leaders are required', {
      leaders: ['Exactly 2 leaders are required'],
    });
  }

  const roles = new Set<ClubRole>();
  const emails = new Set<string>();
  const cins = new Set<string>();

  for (const l of leaders) {
    roles.add(l?.role);

    const email = normalizeEmail((l as any)?.email);
    if (emails.has(email)) {
      validationError('Leaders must have distinct emails', {
        leaders: ['Distinct emails required'],
      });
    }
    emails.add(email);

    const cin = (((l as any)?.cin ?? '') as string).trim();
    if (cins.has(cin)) {
      validationError('Leaders must have distinct CINs', {
        leaders: ['Distinct CINs required'],
      });
    }
    cins.add(cin);
  }

  if (
    roles.size !== 2 ||
    !roles.has(ClubRole.PRESIDENT) ||
    !roles.has(ClubRole.VICE_PRESIDENT)
  ) {
    validationError('Leaders must be President and Vice President', {
      leaders: ['Roles must include PRESIDENT and VICE_PRESIDENT'],
    });
  }
}
