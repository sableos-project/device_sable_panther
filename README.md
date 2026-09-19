# SableOS Panther device integration

Bounded Google Pixel 7 (`panther`) integration and physical qualification boundary for SableOS.

This repository is a **device adapter and runtime qualification owner**. It must not contain forked copies of common Sable applications or common product semantics merely because Panther is the current PRIMARY reference target.

## Current role

Panther remains the primary Android 17 / GrapheneOS-derived product-development/security/runtime target.

Common app behavior belongs in common application/platform repositories. Common imported modules/product selection belong in `vendor_sable`. This repository owns Panther-specific adaptation and Panther runtime evidence only.

Organization-wide security, test, coverage and performance policy is defined in `sableos-project/.github/docs/SECURITY_QUALITY_ENGINEERING.md`.

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
Panther R8 static + functional + regression campaign
        |
        v
fresh reconstruction / repeatability proof
        |
        v
B3 Titan 2 portability image/campaign
```

R8 does **not** make `device_sable_panther` an app compiler/source repository.

The current Panther campaign has established a working R8 development reference with successful boot/static qualification and manual functional exercise of the initial Sable application tranche. That reference is evidence; later UX/application changes must rebuild and requalify rather than rewriting historical results.

## R7 requirement baseline

[`docs/R7_DAILY_DRIVER_VALIDATION.md`](docs/R7_DAILY_DRIVER_VALIDATION.md) remains the runtime baseline for calls, contacts, SMS/MMS, Wi-Fi, cellular data, browser/Internet, notifications, Settings, camera/photos/files, clock/alarm, Calculator baseline and Sable Start access.

Unexecuted cases remain unproven and can serve as regression requirements for the next accepted Panther image.

## Product/build evidence learned from R7/R8

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

A successful compile, static scanner, target-files build or VINTF check does not by itself establish device-runtime correctness. Conversely, one successful manual interaction is recorded as manual functional evidence and is not relabeled as automated regression coverage.

## B2 Panther campaign

Panther image/device work starts only after A1/A2/freeze/B1 close for the selected tranche.

Validate the exact accepted image for, as applicable:

- installed package/component/ABI identity;
- boot/build/slot/security state;
- launcher visibility and launch;
- exact on-device APK/JNI identity where required;
- representative deterministic Rust/JNI execution;
- Sable Start/Home/app-list/search behavior;
- Calculator Standard/Scientific/Converter interaction and accessibility;
- separate Sudoku/Mines/2048 application behavior after the split lands;
- one Sable Reader product with accepted publication/TXT/share/TTS/OCR capability;
- Reader network/model-download policy;
- Media local-vs-network permission/storage/playback behavior;
- cross-app/system intents;
- permissions/AppOps/roles/defaults/exported components;
- SELinux enforcing state and relevant denial review;
- runtime page size and 16 KiB native compatibility;
- Compose/instrumentation/UIAutomator regression where implemented;
- required R7 daily-driver regressions;
- reboot persistence only when reboot is separately authorized.

## Runtime security and privacy evidence

Panther acceptance should verify the runtime consequences of the source/product security policy rather than repeating only source-level scanner results.

Examples include:

```text
unexpected permission/AppOps state
unexpected exported/role/default state
network behavior for apps intended to be offline
SELinux denials or policy broadening
JNI/native crashes or linker failures
FATAL EXCEPTION / ANR / process death
unintended background work or wakeups
sensitive-data persistence or cross-profile leakage where applicable
```

OWASP MASVS/MASTG controls that require runtime evidence should bind to exact Panther build/image identity.

## Performance qualification

Performance work remains measurement-driven. Depending on the change, Panther may provide baseline/regression evidence for:

```text
cold/warm app startup
frame time / jank / missed frames
input-to-render latency
memory PSS/RSS / allocations
CPU time / I/O / wakeups
power/battery impact for sustained/background workloads
focused native/Rust operation latency
```

Use Android Macrobenchmark/tracing/platform metrics where useful and bind results to exact build/device state. Thresholds should come from representative baselines and be ratcheted; do not invent a universal percentage before measurement.

A Panther performance PASS is not a Titan 2 performance PASS.

## Trusted builder transition and reproducibility

`ai-g732` is the intended trusted development builder after private-source/storage/runner/toolchain hardening closes.

Panther acceptance binds to exact trusted A2 artifacts, B1 integration state, build/image hashes and source/manifest identity. Historical successful OUT directories remain immutable evidence rather than hidden build inputs.

Repeatability requires fresh reconstruction from canonical Git source with an isolated OUT_DIR, followed by package/VINTF/device regression. Do not declare reproducibility merely because Ninja reports no work in one existing OUT.

## Titan 2 relationship

Panther acceptance precedes Titan 2 R8 portability qualification. Where compatible, Titan 2 should consume the same frozen common R8 application artifacts and same common `vendor_sable` composition, with an isolated target OUT_DIR and bounded Titan adapter.

A Panther PASS does not imply Titan 2 PASS for runtime, UI/form-factor behavior or performance.

## Signing boundary

Production AVB/OTA/application signing is deferred until repeatable development qualification is satisfactory on both Panther and Titan 2. Development/test signing may be used for engineering images.

The ThinkPad P50 is only a future signing-host candidate; there is no active `sable-signer-01` yet.

## Boundary documents

- [`docs/PORTING_BOUNDARY.md`](docs/PORTING_BOUNDARY.md)
- [`docs/VALIDATION_MODEL.md`](docs/VALIDATION_MODEL.md)
- [`docs/R7_DAILY_DRIVER_VALIDATION.md`](docs/R7_DAILY_DRIVER_VALIDATION.md)

A failure observed on Panther is not by itself proof that the fix belongs in this repository. Classify the failing layer before mutation.
