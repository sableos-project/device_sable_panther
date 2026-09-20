# Panther validation model

> **Current execution overlay — 2026-09-20:** R9 physical Panther acceptance is pending a source-bound fresh full build. Incremental/warmed-OUT target-files composition PASS is not classified as fresh-build proof. Physical flash/runtime validation begins only after the fresh OUT and target-files freshness/causality gates pass.


Status: **normative Panther product/runtime validation model.**

Panther remains the primary physical validation target. Application correctness, trusted artifact production, Panther product integration and Panther runtime correctness are separate claims.

## 1. R8 boundary

### A1 — outside Panther

Disposable source/application qualification covers Rust/Kotlin/Gradle/static/security and upstream Reader/Text Reader gates.

### A2 — trusted standalone app build

`ai-g732` rebuilds accepted application source with pinned toolchains and produces the trusted APK/JNI artifact eligible for the R8 freeze.

### B1 — pre-image product integration

`ai-g732` proves Soong/import, certificate/signing mode, JNI handling, dexpreopt/uses-library state, product selection and PRODUCT_OUT installation before a broad Panther image build.

### B2 — Panther image/device

Panther validation begins only after the exact A2 artifact freeze and B1 product-integration state are known.

## 2. Evidence progression

```text
requirements/source identity
 -> A1 qualification
 -> A2 trusted artifact identity
 -> B1 import/module processing
 -> product selection
 -> PRODUCT_OUT
 -> target-files
 -> filesystem image
 -> image/build hash
 -> installed runtime package/component
 -> runtime certificate/page-size/JNI state
 -> role/default/permission state
 -> user-visible/device behavior
 -> regression/recovery behavior
```

No earlier layer silently proves a later one.

## 3. Claim discipline

Examples:

- A1 Gradle/Rust PASS does not prove A2 trusted artifact identity.
- A2 APK PASS does not prove Soong/product integration.
- PRODUCT_OUT does not prove image membership.
- image inclusion does not prove launcher/default-role behavior.
- a working Activity does not prove HOME adoption.
- one carrier/network path does not qualify every carrier.
- on-device OCR/translation does not prove strict network-free operation when model acquisition may use Internet.
- one Reader upstream APK does not define final one-product Sable Reader composition.

Use `sableos-project/build/docs/MILESTONE_EVIDENCE_GATES.md` and `build/docs/R8_PREIMAGE_GATE.md`.

## 4. R7 baseline

`R7_DAILY_DRIVER_VALIDATION.md` remains the daily-driver matrix for calls/contacts, SMS/MMS, Wi-Fi/cellular, browser/Internet, notifications, Settings, camera/photos/files, clock/alarm, Calculator baseline and Sable Start integration.

R7 product forensics also reinforce source/prebuilt -> graph -> product selection -> PRODUCT_OUT -> target-files/image -> runtime distinctions.

Unexecuted R7 runtime cases remain unproven.

## 5. B2 Panther image prerequisites

Before the next Panther image:

```text
selected A1 lanes PASS or deferred
A2 trusted artifacts PASS
exact R8 application freeze exists
R8-A shared contract aligned
B1 Soong/import/product-selection/PRODUCT_OUT proof PASS
ai-g732 migration/preflight PASS
isolated Panther OUT_DIR bound
```

## 6. Panther image acceptance

Bind the device campaign to exact:

```text
platform_manifest/source identity
trusted A2 app/source/toolchain identities
B1 product integration identity
build host/environment identity
product/release/variant/Build ID
image hashes/fingerprint
package/component inventory
```

Then validate as applicable:

- R8 application presence/launcher visibility;
- package/component/ABI identity;
- R8-A design behavior;
- Calculator/Convert/Games representative interaction/accessibility;
- one Sable Reader accepted EPUB/TXT/share/TTS/OCR composition;
- Reader network/model-download policy;
- Media storage/network boundaries;
- permissions/AppOps/roles/defaults;
- runtime page size;
- representative Rust JNI execution;
- required R7 regressions;
- reboot-dependent behavior only when reboot is authorized.

## 7. Failure classification

```text
REQUIREMENTS
A1_APPLICATION_SOURCE
A1_APPLICATION_BUILD
A2_TRUSTED_ARTIFACT
A2_NATIVE_16K
B1_PRODUCT_IMPORT
B1_PRODUCT_SELECTION
B1_PRODUCT_INSTALL
ANDROID_FRAMEWORK/SUBSTRATE
DEVICE_ADAPTER
VENDOR/BSP/FIRMWARE
CARRIER/NETWORK
RUNTIME_APP
TEST_ENVIRONMENT
UNKNOWN
```

A failure seen on Panther is not sufficient evidence that the fix belongs in `device_sable_panther`.

## 8. Titan 2 sequencing

Titan 2 portability qualification begins after Panther development acceptance for the selected R8 tranche.

Where compatible it should consume the same frozen common R8 artifacts and common `vendor_sable` product integration with a separate OUT_DIR and bounded Titan adapter.

Panther evidence does not substitute for Titan-specific physical-keyboard, square-display, Media3/audio, OCR/TTS, page-size and runtime acceptance.

## 9. Production signing boundary

Production signing is not part of Panther R8 development acceptance. AVB/OTA/production app-key work begins later only after Panther and Titan 2 development qualification is satisfactory.

The ThinkPad P50 is a future signing-host candidate only; no active `sable-signer-01` exists.

## 10. Device-operation authorization

Device contact is separate from mutation authority. State authorization independently for install/uninstall, flashing/update, reboot, radio/network changes, roles/defaults, root/remount, slot changes and userdata/metadata wipe.

## 11. Evidence privacy

Public evidence must avoid phone numbers, message contents, Wi-Fi credentials, private contacts, account identifiers, carrier account data and other secrets while retaining enough sanitized proof for the technical claim.

## 12. Closure

Use bounded results, for example:

```text
IMAGE_IDENTITY=PASS
R8_REQUIRED_PACKAGES=PASS
R8_NATIVE_RUNTIME=PASS/FAIL/BLOCKED
R8_APP_RUNTIME=PASS/FAIL/BLOCKED
R7_DAILY_DRIVER_REGRESSION=PASS/FAIL/BLOCKED
DEFAULT_ROLE_STATE=PASS/NOT_TESTED
REBOOT_PERSISTENCE=PASS/NOT_TESTED
PANTHER_R8_INTEGRATION_CLOSURE=PASS/FAIL
```

Do not replace those layers with one `device works` statement.
