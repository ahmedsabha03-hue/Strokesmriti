Research use only; not validated. v1.1.0 to v1.2.0 add the changes from the neuropsychiatrist review (19 November 2026) and a follow-up methods review, before Phase 1 data collection. v1.2.1 is the Phase 1 version.

Since v0.7.1: healthy control mode; phone-first design (40-item cancellation in landscape, new line bisection, simple reaction time baseline); photographed paper drawings; provisional domain scores (overall index in export only); device class recorded; review fixes to the executive score, autosave and privacy policy. Naming: tortoise and anchor replaced with broom and coconut, regional synonyms added, and a slow or self-corrected marker per item. Visual fields: testing guide and extinction options. Layout adaptation is fixed at the start of each visit from the visual fields.

Since v0.9.7: help for student examiners (plain-language "What is this?" notes, implausible-value checks, recall delay clock, screen kept awake, time per task in the export, mRS steps, NIHSS item 3 mapped to the visual-field options) and practice mode.

v1.0.0: practice mode makes no visit code or QR, so a practice session can never be loaded as a prior visit. Pseudonymous examiner ID and examiner certification status (two supervised practice sessions) are recorded in the export, with a flag for uncertified examiners. Examiner notes carry a no-names prompt and are covered in the privacy policy.

v1.0.1: bug fix only. In practice mode, the message after copying results no longer says a visit code was copied or that results were saved to the device log. No change to tasks, scoring or data.

v1.1.0 (neuropsychiatrist review): arousal and delirium screen before testing (arousal rating plus 4AT item scores from the official form; reduced arousal or 4AT of 4 or more skips the cognitive tasks and flags a re-test); fatigue rating before testing; strength of the arm used and dominant-hand status recorded, with motor-loaded tasks tagged; a new colour and size sequence task (literacy-free sequencing and set-shifting); GAD-2 alongside the PHQ-9; examiner-rated apathy, low mood and emotional lability (draft items, usable in aphasia); a reason code for every task without a score; form-equivalence status in the export; a larger-text option. Existing tasks and scoring are unchanged, so v1.1 data pool with v1.0.x for the shared tasks.

v1.1.1: the acute / discharge window now starts on day 3 (days 3–10), so no patient is tested in the first 72 hours after the index event. Visits on day 0–2 are marked unscheduled. Agreed with the neuropsychiatrist review (D2).

v1.2.0 (methods review of v1.1): the delirium gate no longer blocks on the 4AT total. It blocks only on abnormal arousal, or on item 4 when a checklist of observable delirium features (each with a named source) is positive; an unclear checklist tests and flags; items 2–3 are recorded but never block, with a flag when aphasia makes them untestable. The 4AT is optional at outpatient visits. A blocked visit is replaced by its re-test in the same window. The SADQ-10 (item scores from the official form) replaces the draft observer-rated mood items; a safety question on hopelessness or self-harm thoughts is kept. Colour and size sequence: plain blue and light orange circles (no white centre), circles never shrink below 85% on small screens, and a slightly larger touch zone.

v1.2.1: when 4AT item 4 scores 4, a ticked delirium feature counts even without a source (exported as unrecorded and flagged), and a checklist left uncompleted is treated as uncertain: the patient is tested and the visit flagged. Previously both cases were tested without a flag.

Data from v0.7.x and v0.9.x or later cannot be pooled: cancellation and naming items changed.
