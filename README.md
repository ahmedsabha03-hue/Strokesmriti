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
- Phase 1 runs on v1.2.2; cite this version in the ethics committee protocol.
- Visit windows (stroke): acute / discharge days 3–10, 90 days (75–105), 12 months (330–400); optional 30 days and 6 months. No testing in the first 72 hours.
- Arousal and delirium screen at every patient visit, before any testing. Arousal is always rated. The 4AT is given from its official form at acute and post-procedure visits (optional at outpatient visits) and its item scores are recorded as scored. Testing is blocked only by abnormal arousal, or, when item 4 scores 4, by at least one observable delirium feature in the last 24 hours with a named source (nurse, family, case notes or own observation): alertness or attention varying through the day, new confusion since admission, sleep–wake reversal, hallucinations or misperceptions, new agitation. No feature means the item reflects the fixed stroke deficit and testing goes ahead. A ticked feature counts even if its source is missing (the missing source is flagged). Unclear, or a checklist left uncompleted, means testing goes ahead and the visit is flagged as possible delirium, uncertain. The primary analysis includes flagged visits; a pre-registered sensitivity analysis excludes them, with the 4AT total as a covariate. Every 4AT item and each feature with its source are exported, so a different rule can be applied at analysis without changing the app. At the acute visit the stroke itself is a change in cognition and does not block. Items 2 and 3 never block: they score 2 when untestable in aphasia and pick up the impairment being measured; aphasic untestability is flagged. When testing is blocked, only the mRS, apathy and mood and informant questions are completed, and the re-test inside the same window replaces the blocked visit in the visit code. Testing anyway needs a senior's decision and is flagged. The item 4 rule was set by the PI; the study neuropsychiatrist's review is pending.
- Mood in aphasia: three original observer-rated mood items, plus apathy and emotionalism items, all drafts pending review and needing no permission. A safety question on hopelessness or self-harm thoughts is asked at every patient visit. No instrument that needs permission is used.
- Pilot before Phase 1: run about 20 controls and check that colour and size sequence part A errors are near zero (otherwise the task is measuring size perception), and check `duration_min`, since fatigue will affect the last tasks.
- Missing data: every task without a score carries a reason code (`na_*` columns). Examiners choose the reason on the summary screen.
- Parallel forms: A, B and C are not yet shown to be equivalent (`form_equivalence` in the export). Form equivalence is a pre-registered analysis in the healthy control sessions; change scores across forms are not pooled until it is shown.
- Motor confound: the export records the hand used, the strength of that arm and whether it is the dominant hand. Cancellation, reaction time, pattern matching, Go/No-Go and the colour and size sequence are motor-loaded (`motor_loaded_tasks`).
- Before multi-site data collection, replace the on-device log with an encrypted export into a study database (REDCap is the likely route), with retention and clearing rules and consent mapped to the DPDP Act 2023 and each site's IEC.
- Examiner notes are free text and go into the log and export. No names or other identifiers; check notes before sharing an export.
- Decide in advance whether instructions come from the examiner or the device voice, and keep to it. The export records, per task, where the device voice was used (`vs`) and the translation version (`tv`).
