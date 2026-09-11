# R7 — Panther daily-driver validation matrix

Status: **normative Panther qualification requirements for the current daily-driver milestone.**

Target: Google Pixel 7 (`panther`).

Current reference substrate line: validated GrapheneOS `2026081300` / Android 17 work unless a later exact build identity is recorded.

R7 is a runtime qualification milestone. It does not require every user-facing application to be Sable-owned. It requires a phone that works reliably for normal daily use using a documented, supportable product composition.

## 1. Goal

Prove, with bounded reproducible evidence, that the current SableOS Panther composition supports:

- phone calls;
- contacts sufficient for phone/message workflows;
- SMS;
- MMS;
- Wi-Fi;
- cellular data;
- Internet/browser access;
- notifications;
- Settings access;
- camera/photo workflow;
- files workflow;
- clock/alarm;
- calculator;
- Sable Start access to the installed launchable applications.

The milestone is about practical reliability, not replacing the platform's mature telephony/network stacks.

## 2. Preconditions

Before an R7 run, record:

- exact device model/codename;
- device serial in private/local evidence where appropriate, not necessarily public docs;
- build fingerprint;
- build type (`user`, `userdebug`, etc.);
- Android version/API;
- security patch level;
- exact Sable source/manifest identity if available;
- exact substrate revision/build;
- baseband/modem version;
- carrier/SIM/eSIM context without publishing private account identifiers;
- active slot/build state where relevant;
- whether the device retains user data from earlier builds;
- default HOME package/component;
- selected Phone/Messaging/Browser/Camera/Files/Clock/Calculator packages/components;
- authorization boundary for device contact, reboot, install/uninstall, radio toggles, data changes, or destructive actions.

A single successful test on an unknown build is not sufficient R7 evidence.

## 3. Default application inventory/decision record

Before closure, create a table for every baseline user application:

| Capability | Package/component | Provenance | Privilege/role | Dependencies | Status | Evidence |
| --- | --- | --- | --- | --- | --- | --- |
| Phone | TBD by R7 inventory | AOSP/Graphene/substrate/other | default dialer/telecom integration | telecom/contacts/etc. | undecided until recorded | pending |
| Messaging | TBD | AOSP/Graphene/substrate/other | default SMS role | telephony/MMS/provider | undecided | pending |
| Contacts | TBD | TBD | contacts provider/access | Phone/Messaging | undecided | pending |
| Browser | TBD | TBD | normal app/default browser role as chosen | WebView/engine/update model | undecided | pending |
| Camera | TBD | TBD | camera permission/platform integration | Panther camera stack | undecided | pending |
| Photos/Gallery | TBD | TBD | media access | media provider | undecided | pending |
| Files | TBD | TBD | SAF/documents | document providers | undecided | pending |
| Clock/Alarm | TBD | TBD | alarm APIs/role as applicable | alarm/notification/audio | undecided | pending |
| Calculator | TBD for R7 baseline | inherited or later Sable | none expected | none | temporary acceptable | pending |

Do not fill these rows by assumption. Inspect the actual built/installed product composition.

For every selected component record licensing/redistribution and maintenance ownership in the appropriate product documentation before treating it as a shipping default.

## 4. Telephony — voice calls

### 4.1 Outgoing call

Required flow:

1. confirm SIM/eSIM is registered and ordinary service is available;
2. place an outbound call using the selected Phone app;
3. prove dialing transitions to active/ringing/connected state as expected;
4. prove remote party receives the call;
5. prove two-way audio;
6. terminate normally from the Panther device;
7. verify call history behavior sufficient for normal use.

Capture:

- focused Phone/InCall activity where useful;
- telecom/radio logs only as needed and with private numbers redacted;
- call-state transitions where available;
- relevant fatal/system errors.

### 4.2 Incoming call

Required flow:

1. call the Panther number from another phone;
2. verify ring/notification/full-screen incoming-call presentation according to the selected Phone app/system state;
3. answer;
4. prove two-way audio;
5. terminate normally;
6. verify missed-call behavior separately if practical.

Test at least once with the device unlocked. Lock-screen behavior should also be tested before strong daily-driver closure if the current product is expected to handle calls while locked.

### 4.3 Audio routing

At minimum prove normal earpiece and speakerphone routing if both are expected daily-driver functions.

Bluetooth/headset behavior is desirable but may be a separately recorded extension if not yet required for the first R7 closure. Do not claim it by implication.

### 4.4 Emergency calling

Do **not** place real emergency calls for routine validation. Preserve platform emergency-call support by architecture and use non-emergency/platform-safe inspection where possible. Any live emergency test requires a separately coordinated, lawful test procedure.

### 4.5 Carrier scope

One carrier/SIM passing establishes only that tested carrier context. Record carrier-specific limitations. Do not generalize one successful IMS/VoLTE path to all networks.

## 5. Contacts

Minimum daily-driver behavior:

- view existing contact;
- create a test contact if data mutation is authorized;
- use a contact to initiate a call;
- use a contact to initiate an SMS;
- contact name resolves correctly in Phone/Messaging where expected;
- process restart does not unexpectedly lose saved contact data.

If contact sync/account integration is not part of the current product baseline, document that rather than treating local contacts as proof of cloud sync.

## 6. SMS

### 6.1 Outgoing SMS

- send a short text to a known test number;
- prove receipt on the remote device;
- prove conversation thread persistence;
- prove sent status consistent with the chosen app/platform semantics;
- check for relevant telephony/messaging failures.

### 6.2 Incoming SMS

- send to Panther from another device;
- prove notification appears;
- tap notification and verify correct conversation;
- prove message content persists after Messaging app process restart.

### 6.3 Long/multipart text

If ordinary product use expects multipart SMS behavior, include at least one long-message test or explicitly defer it.

## 7. MMS

MMS is separate from SMS and must be tested separately.

Required baseline:

- outbound MMS containing at least one image/attachment;
- inbound MMS containing at least one image/attachment;
- attachment renders/opens sufficiently for normal use;
- notifications/tap-through work;
- carrier cellular-data/APN behavior is recorded;
- failure/retry state does not silently drop the message.

Where the carrier requires cellular data for MMS even while Wi-Fi is connected, test the real behavior rather than assuming the platform handles it.

RCS is explicitly outside the basic SMS/MMS claim unless separately selected and tested.

## 8. Wi-Fi

Required flow:

1. enable Wi-Fi through the supported platform UI/API;
2. observe target access point;
3. connect using normal user flow;
4. prove local IP configuration;
5. prove DNS resolution;
6. prove HTTPS Internet access;
7. disconnect/reconnect or toggle Wi-Fi and prove recovery;
8. prove connection remains usable after a practical screen-off/sleep interval where possible.

Record:

- SSID in private evidence or use a sanitized label in public docs;
- IP/DNS state without exposing unnecessary private network details;
- route/transport state;
- browser or command-level reachability evidence as appropriate.

Do not mutate saved networks beyond the authorized test scope.

## 9. Cellular data

Required flow:

1. disable Wi-Fi;
2. confirm mobile-data setting/state;
3. prove cellular network registration;
4. prove DNS resolution over cellular;
5. prove HTTPS Internet access;
6. exercise at least one ordinary app over cellular;
7. transition from cellular to Wi-Fi and back, proving connectivity recovers.

Record exact carrier context and whether 5G/LTE mode matters to the observed result.

Do not claim tethering/hotspot, roaming, dual-SIM, VPN, or private-DNS edge cases unless separately tested.

## 10. Browser / Internet

Use the selected proven browser for R7; a Sable-owned browser is not required.

Required baseline:

- launch from Sable Start;
- navigate to multiple HTTPS sites under ordinary connectivity;
- DNS/TLS/page load works;
- open an HTTP(S) link from another application through Android intent resolution/default handling;
- download a small ordinary file if downloads are part of the selected browser baseline;
- open/share a downloaded file through the normal Android flow where practical;
- browser survives process restart with the expected ordinary behavior.

Security-update provenance for the browser must be documented separately from a simple runtime pass.

## 11. Notifications

Validate at minimum:

- incoming call notification/presentation;
- SMS/MMS notification;
- one ordinary non-telephony application notification where available;
- tap-through opens the expected target;
- dismissal works;
- notification permission behavior is understood for Android 17 target apps;
- no Sable Start behavior suppresses or hijacks normal notifications.

If lock-screen notification privacy behavior is part of the product, record/test it separately.

## 12. Settings

The daily-driver baseline requires access to normal system Settings for platform-owned functions.

At minimum confirm practical access to:

- Wi-Fi;
- mobile network/data;
- Bluetooth if present in baseline UI;
- display/appearance;
- sound;
- notifications;
- permissions/app info;
- storage;
- security/privacy entry points relevant to the current product.

Sable Start may deep-link to Settings, but must not reimplement complex platform settings merely for branding.

## 13. Camera / photos

### 13.1 Capture

- launch selected Camera app;
- capture a normal rear-camera photo;
- verify file/media record exists;
- reopen/view it through the normal photo/gallery flow;
- confirm camera app does not fatally fail.

Front camera/video/night mode/advanced features should be recorded separately unless explicitly required for first R7 closure.

### 13.2 Media/open flow

- open/select a photo from another app using supported picker/document flow if available;
- verify Android media permission behavior remains coherent;
- avoid granting broad media access merely to simplify a Sable surface.

## 14. Files

Minimum flow:

- launch selected Files/document UI;
- browse a normal accessible directory/provider;
- open a small text/image/PDF or another ordinary supported test file;
- invoke an open/share flow from another app where practical;
- verify Storage Access Framework/provider behavior rather than assuming raw filesystem access is required.

A future Sable Files UI must not weaken Android scoped-storage/document-provider boundaries.

## 15. Clock / alarm

R7 needs working alarm capability even if inherited.

Minimum flow:

- create an alarm a few minutes in the future;
- prove alarm fires with expected UI/audio/notification behavior;
- dismiss it;
- create/cancel another alarm;
- confirm ordinary time zone/time display behavior.

Testing alarm persistence across reboot is valuable but requires explicit reboot authorization; if not performed, do not claim it.

Timer/stopwatch are useful but may be secondary to alarm readiness.

## 16. Calculator

R7 baseline only needs a working calculator application. It may be inherited.

Prove launch and representative basic operations.

The Sable-owned Calculator is an R9 target and must not block R7 daily-driver closure if a suitable temporary calculator exists.

## 17. Sable Start integration

R7 assumes R6 has established reliable launcher inventory/search behavior.

During R7, verify baseline applications are:

- visible in All Apps;
- searchable by the documented R6 behavior;
- launchable;
- not duplicated/missing because of product composition mistakes.

Do not use hidden adb-only launch paths as a substitute for normal daily-driver UI availability.

## 18. Data persistence/reboot boundary

Many daily-driver capabilities involve persistence, but reboot is a separate authorized operation.

If reboot is authorized for the qualification run, recommended persistence checks include:

- Wi-Fi reconnect;
- cellular registration;
- default Phone/Messaging roles;
- SMS conversation persistence;
- contact persistence;
- alarm persistence where applicable;
- Sable customization later under R8.

If reboot is not authorized, clearly mark these as untested rather than inferring them.

## 19. Failure classification

Classify failures before changing code:

```text
PRODUCT_UI
SABLE_COMMON_CODE
ANDROID_FRAMEWORK/SUBSTRATE
DEVICE_ADAPTER
VENDOR/BSP/FIRMWARE
CARRIER/NETWORK
TEST_ENVIRONMENT
UNKNOWN
```

Do not patch Sable Start to hide a telephony or carrier failure.

Do not place a common workaround in `device_sable_panther` unless evidence shows the problem is genuinely Panther-specific.

## 20. Evidence handling

For each capability record:

- test ID/name;
- prerequisites;
- exact build/device identity;
- action sequence;
- observed result;
- focused logs/screenshots/state dumps needed to substantiate the claim;
- result: PASS / FAIL / BLOCKED / NOT TESTED;
- claim boundary/known limitation.

Avoid huge undifferentiated log dumps when a focused state extract proves the behavior. Preserve raw evidence when needed, but summarize it deterministically.

Redact phone numbers, message content, Wi-Fi credentials, account identifiers, and other secrets from public GitHub documentation.

## 21. Destructive/network-sensitive test policy

R7 naturally requires network/device interaction. Each gate should explicitly state what is authorized.

Do not silently perform:

- factory reset;
- userdata/metadata wipe;
- slot changes;
- bootloader changes;
- root/remount;
- package uninstall;
- carrier/APN destructive edits;
- reboot;
- SIM/eSIM changes;

unless separately authorized by the test plan/user.

## 22. Initial R7 closure matrix

The first closure report should have a table at least this explicit:

| Capability | Minimum result for R7 | Status |
| --- | --- | --- |
| Outgoing voice call | connected + two-way audio + normal hangup | pending |
| Incoming voice call | presented + answered + two-way audio | pending |
| Contacts | view/use for call and message | pending |
| Outgoing SMS | remote receipt | pending |
| Incoming SMS | notification + conversation receipt | pending |
| Outgoing MMS | attachment delivered | pending |
| Incoming MMS | attachment received/viewable | pending |
| Wi-Fi | connect + DNS + HTTPS + reconnect | pending |
| Cellular data | DNS + HTTPS with Wi-Fi off | pending |
| Wi-Fi/cellular handoff | connectivity recovers both directions | pending |
| Browser | normal HTTPS + external link intent | pending |
| Notifications | calls/messages + ordinary app | pending |
| Settings | core connectivity/app/privacy surfaces reachable | pending |
| Camera | capture + view photo | pending |
| Files | browse + open normal file | pending |
| Clock/alarm | alarm fires/dismisses | pending |
| Calculator | launch + basic arithmetic | pending |
| Sable Start integration | baseline apps visible/searchable/launchable | pending |

Additional capabilities can be recorded, but this baseline should not be silently weakened.

## 23. R7 non-goals

Not required for first R7 closure unless separately added:

- custom Sable Phone;
- custom Sable Messaging;
- RCS;
- all carriers worldwide;
- dual-SIM qualification;
- roaming qualification;
- Wi-Fi calling;
- hotspot/tethering;
- eSIM provisioning UI;
- Bluetooth automotive/audio matrix;
- custom Sable Camera;
- custom browser;
- perfect theme consistency across inherited apps.

Some may be necessary before a public production release, but they are not automatically prerequisites for this daily-driver development milestone.

## 24. Definition of R7 done

R7 Panther qualification is complete when:

- each baseline capability has a PASS or an explicitly accepted documented limitation;
- Phone/Messaging/Browser/Camera/Files/Clock/Calculator component choices are recorded rather than assumed;
- calls, SMS, MMS, Wi-Fi, cellular data, Internet, and critical notifications work in real runtime testing;
- the selected apps are accessible through normal Sable Start UI;
- no test result depends on an undocumented local hack or old workspace-only source;
- failures/limitations are attributed to the correct layer;
- evidence is bound to an exact build/source/device identity;
- no claim extends beyond the carrier/network/device contexts actually tested.

After R7, product work can move to R8 shared design/customization without losing sight of any documented daily-driver gaps.