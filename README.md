# StrokeSmriti

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

## Data

Nothing leaves the device unless the examiner copies it. The Android app's data is excluded from device backups. See `web/privacy.html`.
