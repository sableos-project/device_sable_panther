# Panther validation model

Panther remains the primary physical validation target for current SableOS development.

## Evidence progression

Changes should be qualified in layers appropriate to the claim:

1. exact source identity and bounded diff;
2. static/pre-build checks;
3. module or affected-target build;
4. artifact/package inspection;
5. controlled device deployment when separately authorized;
6. runtime/interaction validation;
7. provider/network/hardware behavior validation;
8. regression and recovery validation for broader system changes;
9. clean source reconstruction when the claim depends on repository/manifest portability.

## Claim discipline

Compilation does not prove runtime correctness. A working preview Activity does not prove HOME-role adoption or SystemUI replacement. One launch timing does not establish performance. Provider package presence does not prove user data correctness. One carrier/network path does not qualify every carrier. A screenshot of an app list does not by itself prove launcher-inventory completeness.

Use `sableos-project/build/docs/MILESTONE_EVIDENCE_GATES.md` for the current gate/evidence model.

## Current source/build boundary

The validated Sable Start R3 source has progressed beyond the old compile-stage description:

- recursive R4 source capture into `sableos-project/packages_apps_SableStart` passed;
- exact local migration commit/tree seal passed;
- the sealed migration commit was pushed without rewrite;
- PR #1 contains the 12 validated source additions;
- direct build/reconstruction from the migrated checkout remains an R5 gate until its actual build evidence is reviewed;
- clean reconstruction through `platform_manifest` remains separate.

Do not treat the historical Panther workspace copy as permanent architecture merely because it was the original validation source.

## R6 relationship

After R5 migration/build closure, Sable Start R6 owns launcher-visible inventory, Search sharing, live package refresh, launch behavior, and local-time greeting requirements in:

```text
packages_apps_SableStart/docs/R6_ALL_APPS_AND_GREETING.md
```

Panther provides the primary physical runtime validation target, but R6 behavior remains common Sable Start behavior rather than Panther-specific code.

## R7 daily-driver qualification

The next broad Panther system-qualification milestone is:

```text
docs/R7_DAILY_DRIVER_VALIDATION.md
```

R7 covers calls, contacts, SMS/MMS, Wi-Fi, cellular data, browser/Internet, notifications, Settings, camera/photos, files, clock/alarm, calculator, and their accessibility through Sable Start.

Daily-driver failures must be classified to the correct layer before mutation:

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

A failure observed on Panther is not sufficient evidence that the fix belongs in `device_sable_panther`.

## Device-operation authorization

Physical-device validation should explicitly state authorization for device contact and any additional operations such as install/uninstall, reboot, radio/network state changes, role/default-app changes, slot changes, root/remount, or userdata/metadata wipe.

Routine validation must not infer destructive authorization from permission to contact the device.

## Evidence privacy

Public Panther qualification records should avoid publishing phone numbers, message contents, carrier account identifiers, Wi-Fi credentials, private contact data, or other user secrets. Preserve enough sanitized evidence to substantiate the technical claim.