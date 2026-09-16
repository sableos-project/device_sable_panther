# SableOS Panther device integration

Bounded Google Pixel 7 (`panther`) integration and physical qualification boundary for SableOS.

This repository is a **device adapter and runtime qualification owner**. It must not contain forked copies of common Sable applications or common product semantics merely because Panther is the current PRIMARY reference target.

## Current role

Panther remains the primary Android 17 / GrapheneOS-derived product-development/security/runtime target.

Common app behavior belongs in common application/platform repositories. Common imported modules/product selection belong in `vendor_sable`. This repository owns Panther-specific adaptation and Panther runtime evidence only.

## Current R8 sequence

```text
R7 evidence baseline
        |
        v
A1 disposable application qualification
        |
        v
A2 trusted standalone application build on ai-g732
        |
        v
exact R8 application freeze
        |
        v
B1 pre-image Soong/product integration on ai-g732
        |
        v
B2 Panther development image
        |
        v
Panther R8 integration/regression campaign
        |
        v
B3 Titan 2 portability image/campaign
```

R8 does **not** make `device_sable_panther` an app compiler/source repository.

## R7 requirement baseline

[`docs/R7_DAILY_DRIVER_VALIDATION.md`](docs/R7_DAILY_DRIVER_VALIDATION.md) remains the runtime baseline for calls, contacts, SMS/MMS, Wi-Fi, cellular data, browser/Internet, notifications, Settings, camera/photos/files, clock/alarm, Calculator baseline and Sable Start access.

Unexecuted cases remain unproven and can serve as regression requirements for the next accepted Panther image.

## Product/build evidence learned from R7

Panther build forensics reinforced:

```text
source/prebuilt
 -> graph edge
 -> product selection
 -> PRODUCT_OUT
 -> target-files
 -> filesystem image
 -> runtime
```

Recent firmware packaging evidence established direct standalone vendor-prebuilt/product/target-files provenance for ABL, aggregate bootloader and radio. This is build/product evidence, not runtime evidence.

## B2 Panther campaign

Panther image/device work starts only after A1/A2/freeze/B1 close for the selected tranche.

Validate the exact accepted image for:

- installed package/component/ABI identity;
- launcher visibility/launch;
- R8-A Follow system/Light/Dark/accent behavior;
- Calculator/Convert/Games representative interaction/accessibility;
- one Sable Reader product with accepted EPUB/TXT/share/TTS/OCR capability;
- Reader network/model-download policy;
- Media local-vs-network permission/storage behavior;
- cross-app/system intents;
- permissions/AppOps/roles/defaults;
- native JNI execution and runtime page size;
- required R7 daily-driver regressions;
- reboot persistence only when reboot is separately authorized.

## Trusted builder transition

The next R8 Panther image is planned on migrated `ai-g732`, after storage/source/tool/output preflight/sealing.

Panther acceptance binds to exact trusted A2 artifacts, B1 integration state, build/image hashes and source/manifest identity. Do not schedule another broad ThinkPad image solely because historical OUT exists.

## Titan 2 relationship

Panther acceptance precedes Titan 2 R8 portability qualification. Where compatible, Titan 2 should consume the same frozen common R8 application artifacts and same common `vendor_sable` composition, with an isolated target OUT_DIR and bounded Titan adapter.

A Panther PASS does not imply Titan 2 PASS.

## Signing boundary

Production AVB/OTA/application signing is deferred until both Panther and Titan 2 development qualification are satisfactory. Development/test signing may be used for engineering images.

The ThinkPad P50 is only a future signing-host candidate; there is no active `sable-signer-01` yet.

## Boundary documents

- [`docs/PORTING_BOUNDARY.md`](docs/PORTING_BOUNDARY.md)
- [`docs/VALIDATION_MODEL.md`](docs/VALIDATION_MODEL.md)
- [`docs/R7_DAILY_DRIVER_VALIDATION.md`](docs/R7_DAILY_DRIVER_VALIDATION.md)

A failure observed on Panther is not by itself proof that the fix belongs in this repository. Classify the failing layer before mutation.
