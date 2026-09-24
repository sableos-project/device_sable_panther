# SableOS Panther device integration

## Status — frozen reference

Google Pixel 7 (`panther`) completed R9 physical acceptance and is now a
**REFERENCE_FROZEN** target.

```text
R9_PANTHER_PHYSICAL_ACCEPTANCE=PASS
R9_PANTHER_DEVELOPMENT=HOLD_REFERENCE_MAINTENANCE_ONLY
INTERACTION_PROFILE=TOUCH_FIRST
```

This repository remains the bounded Panther adapter/runtime-evidence owner. It
must not become the active home for keyboard-first product work.

Panther remains useful for:

- regression checks of common Sable applications/services;
- Android 17 / GrapheneOS-derived architecture comparison;
- security/privilege/reference behavior;
- known-good build/flash/evidence patterns;
- comparison when promoting a future PRIMARY Pixel.

New product features should be designed in common Sable repositories and
qualified first on the active keyboard-first targets unless the feature is
specifically Panther maintenance.

## Frozen reference identity

```text
R9_PANTHER_IMAGE_SOURCE=6f1d6d2f0f2525067874238c4b797ad58f2bcbc6
R9_PANTHER_TARGET_FILES_SHA256=08ef429c7f9eef17de7ddad4ce9baa81911950e8d34b6751b6e4588f66821502
REFERENCE_BRANCH=reference/panther-r9-accepted-20260924
```

These IDs describe the accepted image. Later documentation/build-tool commits do
not become new Panther image qualification sources.

## Accepted launcher boundary

The final R9 architecture is:

```text
org.sableos.launcher / SableLauncher
    HOME / Start / All Apps / Search / Peek / app context

Launcher3QuickStep
    retained Recents/Overview/task substrate
    not HOME eligible
```

Historical documentation describing Launcher3 as the user-facing HOME owner is
superseded.

## Device-support relationship

```text
Panther        frozen touch-first reference
Titan 2        active keyboard-first PORTABILITY/N0
Titan 2 Elite  independent keyboard-first PORTABILITY candidate
Q27            research / future product candidate
```

A Panther PASS never implies Titan runtime, camera, keyboard, telephony or
performance PASS.

Common applications and product semantics belong outside this device repository.

## Tooling role

K1/K2 preserves Panther as the qualified `target-files` / A-B fastboot deployment adapter while moving generic artifact identity and common deployment safety/evidence into shared tooling. This does not reopen the frozen Panther image source.
