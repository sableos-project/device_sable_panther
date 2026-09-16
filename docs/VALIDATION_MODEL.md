# Panther validation model

Status: **normative Panther product/runtime validation model.**

Panther remains the primary physical validation target for current SableOS development. Application correctness and Panther product/runtime correctness are deliberately separated so the device is not used to compensate for missing standalone app tests.

## 1. Two-process boundary

### Process A — outside this repository

Standalone R8 application qualification happens through the application's Cargo/Gradle/upstream workflow and disposable CI/local test environments.

Examples:

- Rust domain correctness/security;
- Kotlin/JVM tests;
- Android lint/static analysis;
- standalone APK builds;
- JNI/native ABI packaging;
- Reader/Text Reader upstream pin/flavor tests;
- APK package/permission/hash sealing.

A Process A PASS is a prerequisite/input for Panther integration, not Panther runtime proof.

### Process B — Panther product/device integration

Panther validation begins from exact frozen source/artifact/image identities and proves Android product/device behavior.

## 2. Evidence progression

For a product/device claim use the appropriate ladder:

```text
requirements/source identity
 -> standalone qualified artifact identity
 -> product import/module declaration
 -> product selection
 -> PRODUCT_OUT
 -> target-files/image
 -> image/build hash
 -> installed runtime package/component
 -> role/default/permission state
 -> user-visible/device behavior
 -> regression/recovery behavior
```

Not every change needs every layer, but no earlier layer silently proves a later one.

## 3. Claim discipline

Examples:

- Rust/Gradle compile does not prove image inclusion.
- image inclusion does not prove launcher/default-role behavior.
- a working Activity does not prove HOME adoption.
- one screenshot does not prove launcher inventory completeness.
- one carrier/network path does not qualify every carrier.
- on-device OCR/translation does not prove strict network-free operation when model acquisition may use Internet.
- one Reader upstream APK does not define the final one-product Sable Reader composition.

Use `sableos-project/build/docs/MILESTONE_EVIDENCE_GATES.md` for the current evidence gate model.

## 4. Historical R5/R6 context

Earlier Panther/SableStart work established source migration/build and launcher requirements. Those records remain historical evidence but are no longer the forward milestone sequence.

Do not treat the historical workspace copy or an old build output tree as permanent architecture merely because it produced valuable evidence.

## 5. R7 baseline

`R7_DAILY_DRIVER_VALIDATION.md` remains the daily-driver requirement matrix for:

- calls/contacts;
- SMS/MMS;
- Wi-Fi/cellular;
- browser/Internet;
- notifications;
- Settings;
- camera/photos/files;
- clock/alarm;
- Calculator baseline;
- Sable Start integration.

R7 also established/strengthened Panther product-wiring evidence. Recent firmware forensics proved direct source/product/target-files provenance for ABL, aggregate bootloader and radio, while keeping current-graph declaration, historical output execution and runtime claims distinct.

Unexecuted R7 runtime cases remain unproven and can serve as regression gates for the next accepted R8 image.

## 6. R8 Panther integration gate

Panther image/device work starts only after:

```text
selected R8 standalone app lanes PASS or explicitly deferred
exact R8 integration freeze exists
shared R8-A contract aligned
Android product import/wiring mechanism proven
trusted builder migration/preflight PASS
```

The next intended full R8 Panther build is on `ai-g732` after the expanded-storage/source/tool environment is sealed.

## 7. R8 image acceptance

Bind the device campaign to exact:

```text
platform_manifest/source identity
frozen app artifact/source identities
build host/environment identity
product/release/variant/Build ID
image hashes/fingerprint
package/component inventory
```

Then validate as applicable:

- R8 application presence and launcher visibility;
- app package/component/ABI identity;
- R8-A design behavior;
- Calculator/Convert/Games representative interaction/accessibility;
- Sable Reader accepted EPUB/TXT/share/TTS/OCR composition;
- Reader network/model-download policy;
- Media local storage and Internet-radio authority boundaries;
- permissions/AppOps/roles/defaults;
- required R7 regressions;
- reboot-dependent behavior only when reboot is authorized.

## 8. Failure classification

Before source/product mutation classify failures:

```text
REQUIREMENTS
APPLICATION_SOURCE
APPLICATION_BUILD
JNI_NATIVE
ARTIFACT_PROVENANCE
PRODUCT_IMPORT
PRODUCT_SELECTION
PRODUCT_INSTALL
ANDROID_FRAMEWORK/SUBSTRATE
DEVICE_ADAPTER
VENDOR/BSP/FIRMWARE
CARRIER/NETWORK
RUNTIME_APP
TEST_ENVIRONMENT
UNKNOWN
```

A failure seen on Panther is not enough evidence that the fix belongs in `device_sable_panther`.

## 9. Device-operation authorization

Device contact is separate from mutation authority. State authorization independently for:

- install/uninstall;
- flashing/update;
- reboot;
- radio/network changes;
- role/default-app changes;
- root/remount;
- slot changes;
- userdata/metadata wipe.

Do not infer destructive permission from permission to inspect the device.

## 10. Evidence privacy

Public qualification records must avoid disclosing phone numbers, message contents, Wi-Fi credentials, private contacts, account identifiers, carrier account data or other user secrets.

Sanitize while preserving enough evidence to substantiate the technical claim.

## 11. Closure

A Panther campaign reports bounded results, for example:

```text
IMAGE_IDENTITY=PASS
R8_REQUIRED_PACKAGES=PASS
R8_APP_RUNTIME=PASS/FAIL/BLOCKED
R7_DAILY_DRIVER_REGRESSION=PASS/FAIL/BLOCKED
DEFAULT_ROLE_STATE=PASS/NOT_TESTED
REBOOT_PERSISTENCE=PASS/NOT_TESTED
PANTHER_R8_INTEGRATION_CLOSURE=PASS/FAIL
```

Do not replace those layers with a single "device works" statement.