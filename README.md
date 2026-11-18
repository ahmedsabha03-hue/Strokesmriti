# StrokeSmriti

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.24323874.svg)](https://doi.org/10.5281/zenodo.24323874)

Clinician-administered cognitive outcome assessment after stroke and stroke procedures. Eight languages, offline, no server.

This repository holds both releases from the same code:

- `web/`: the installable web app. GitHub Pages publishes it.
- `android-app/`: the Play Store app (Capacitor wrapper around `web/`). GitHub builds it in the cloud.

## One-time setup (about an hour)

1. **GitHub.** Create a free account and a new repository named `strokesmriti`. Upload the contents of this folder, keeping the structure, including the hidden `.github` folder.
2. **Signing key.** Open `strokesmriti_signing_secrets.txt` (sent separately; it is not in this folder). In the repository go to Settings > Secrets and variables > Actions, and add the four secrets exactly as named there. Then store the file somewhere safe and offline. Never upload it to the repository.
3. **Website.** Settings > Pages > Source: GitHub Actions. Then Actions > Publish website > Run workflow. The site appears at `https://<username>.github.io/strokesmriti/`.
4. **Domain (optional).** Buy a domain such as `strokesmriti.in`. In Settings > Pages > Custom domain, enter it, and add the DNS records GitHub shows at your registrar. Tick Enforce HTTPS once it is offered.
5. **Android build.** Actions > Build Android app > Run workflow. When it finishes (about 10 minutes), download `strokesmriti-android` from the run page. It holds the `.aab` for the Play Store and an `.apk` you can install directly on a tablet to test.

## Play Store

1. Register at play.google.com/console (one-time fee of USD 25, about ₹2,100). A personal account needs identity verification. Google requires new personal accounts to run a closed test with at least 12 testers for 14 days before releasing to production. Line up 12 colleagues with Android phones or tablets early.
2. Create the app, then use `STORE_LISTING.md` for the text and the files in `store-graphics/` for the images.
3. Privacy policy URL: `https://<your site>/privacy.html`. The contact email is already in `web/privacy.html`.
4. Let Google manage the app signing key (Play App Signing). The key in the secrets file is only the upload key.
5. Upload the `.aab` to Closed testing, add the testers, and after 14 days apply for production.

## Releasing an update

1. Replace `web/index.html` with the new version (Claude supplies it).
2. In `web/sw.js`, change `VERSION` to the new number, or tablets keep the old copy.
3. In `android-app/android/app/build.gradle`, raise `versionCode` by one and set `versionName`.
4. Commit. The website updates on its own. Run the Android workflow and upload the new `.aab` to Play.

## Licence and citation

Software: MIT. Instrument content (items, drawings, scoring, translations): CC BY-NC-ND 4.0. See `LICENSE`, `THIRD_PARTY.md` and `CITATION.cff`. Each GitHub release is archived on Zenodo; the DOI below always resolves to the latest version. Cite StrokeSmriti as: Ahmed S. StrokeSmriti: a multilingual, offline, clinician-administered assessment of cognitive outcomes after stroke and stroke procedures. Zenodo. doi:10.5281/zenodo.24323874

## Data

Nothing leaves the device unless the examiner copies, downloads or shares it. Each completed assessment is kept in a log on the device; export it after each clinic and clear it. The Android app's data is excluded from device backups. See `web/privacy.html`.

Study protocol requirements for sites:
- Collect study data with the Android app. On the website the log sits in browser storage and "Clear browsing data" erases it.
- Use phones or tablets with a screen lock; the log holds many patients' records unencrypted.
- Phones (at least 360 px wide) and tablets both work. Speed scores are reported minus each patient's simple reaction time on the same device, which removes most of the difference in touch delay between devices. The export records the device class and screen size; where possible use one device model per site.
- Each examiner gets a pseudonymous code (for example NIM-07) from a site examiner list kept off the device, and enters it at every session; the export carries it as `examiner_id` for examiner effects and inter-rater agreement.
- Certification: an examiner tests study patients alone only after two supervised practice sessions (practice mode) with a certified senior who signs them off. Until then they choose "No" for Examiner certified and test only with a certified examiner present. The export records this as `examiner_certified`.
- Examiner notes are free text and go into the log and export. No names or other identifiers; check notes before sharing an export.
- Decide in advance whether instructions come from the examiner or the device voice, and keep to it. The export records, per task, where the device voice was used (`vs`) and the translation version (`tv`).
