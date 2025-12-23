export const DEFAULT_CLUB_LOGO_URL =
  'https://<your-public-url>/defaults/club.png';

/*Small but important best practice
Use a separate folder, never mix with user uploads:
Copy code

assets/
  defaults/
    club.png
    avatar.png
clubs/
  <clubId>/
    logo.png
This avoids accidental deletion logic touching defaults.*/
