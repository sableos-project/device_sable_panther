# Panther validation model

Status: **current frozen-reference validation model — 2026-09-24**

Panther R9 physical acceptance is complete. This document now defines how Panther
is used as a regression/reference target without reopening active feature
development.

## Accepted boundary

The accepted R9 reference proved:

- standalone `org.sableos.launcher` HOME;
- Launcher3QuickStep Recents-only;
- accepted first-party product composition;
- source-bound full CI;
- fresh source-specific full image;
- artifact registration;
- controlled preserved-data flash;
- post-flash smoke/runtime identity;
- user-visible branding cleanup;
- Settings-hosted Light/Dark propagation;
- privileged-permission allowlist runtime cleanliness.

Historical exact source/artifact/evidence identities remain the authority for
that accepted image.

## Future Panther use

Panther may be used for:

- regression of common Sable app semantics;
- Android 17/reference substrate comparison;
- security/privilege regression;
- common build/artifact/deployment regression where safe;
- comparison when promoting a future Pixel.

It is not the default target for new keyboard-first UX.

## K1/K2 tooling regression

Panther is the qualified `target-files` / A-B fastboot adapter.

K1/K2 refactored registry/deployment architecture but did not change the frozen
Panther image source. Host-only compatibility can be proven by reading/verifying
the historical registry record and generating the Panther flash plan without
contacting the device.

A new Panther image/flash is required only when a new claim actually changes
Panther image inputs/runtime behavior.

## Evidence layers

Keep separate:

```text
source/CI
build
product composition
artifact registration
flash
runtime acceptance
```

Do not infer a later PASS from an earlier layer.

## Titan relationship

Titan 2 and Titan 2 Elite are independently qualified. Panther evidence is a
reference, not portable hardware proof.

## Historical R7 matrix

`R7_DAILY_DRIVER_VALIDATION.md` is retained as historical requirement/evidence
context. Its old pending rows are not current project-status indicators.
