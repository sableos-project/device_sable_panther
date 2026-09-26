# SableOS Panther device integration

## Status — frozen reference

Google Pixel 7 (`panther`) completed the final R9 Sable Hub V1 physical closure
and is now a **REFERENCE_FROZEN** target.

```text
R9_PANTHER_HUB_V1_CLOSURE=MERGED_PR_110
R9_PANTHER_PHYSICAL_ACCEPTANCE=PASS_WITH_PRESERVED_PLAY_STATE
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
R9_PANTHER_IMAGE_SOURCE=edf62e5bb08372a1395841d6cc5d78d3148a7695
R9_PANTHER_TARGET_FILES_SHA256=a0b359613c4f30e9a834fba212e0b044a97d63ed0537c59471c31b99b627d285
PRIVATE_MERGE_COMMIT=f175b00f
REFERENCE_STATE=FROZEN_AFTER_HUB_V1_CLOSURE
```

Public product/UI demo publication is deferred until production-release-ready
video hosting is available through the SableOS.org / Cloudflare publication
path. This repository should not link demo-only GitHub Releases because release
tags automatically expose source archives.

These IDs describe the accepted image. Later documentation/build-tool commits do
not become new Panther image qualification sources.

The earlier `6f1d6d2f` / `08ef...` Panther reference remains historical evidence
only.

## Accepted product boundary

Panther proves the touch-first Sable product family, Sable Hub V1 and the
canonical target-files/A-B fastboot deployment path.

Sable Hub V1 is:

```text
Priority | Messages | Email | People
```

Hub is an aggregator and interaction surface. Source providers retain ownership
of their account/database/protocol semantics.

## Device-support relationship

```text
Panther        frozen touch-first reference
Titan 2        active keyboard-first PORTABILITY/N0
Titan 2 Elite  independent keyboard-first PORTABILITY candidate
Q27            research / future product candidate
```

A Panther PASS never implies Titan runtime, camera, keyboard, telephony,
restore, display, radio or performance PASS.

Common applications and product semantics belong outside this device repository.

## Tooling role

K1/K2 preserves Panther as the qualified `target-files` / A-B fastboot deployment
adapter while moving generic artifact identity and common deployment
safety/evidence into shared tooling. This does not reopen the frozen Panther
image source.

## Open follow-ups

Appearance/theme propagation and other polish issues remain open in the private
integration repository until Titan 2 SableOS install work proves or supersedes
them. They should not be silently closed by this Panther repository.
