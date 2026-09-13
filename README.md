# SableOS Panther device integration

Bounded Pixel 7 (`panther`) integration for SableOS.

This repository is a device adapter and qualification boundary. It must not contain forked copies of common Sable applications or common product semantics merely because Panther is the current reference device.

## Current reference role

Panther is the primary development/validation target for the current Android 17 / GrapheneOS `2026091000` substrate work.

Common Sable behavior belongs in `platform_sable`, `packages_apps_*`, or other common repositories. This repository owns only Panther-specific integration and Panther runtime qualification evidence/requirements.

## R6 product adapter

R6 introduces a thin derivative product named `sable_panther`.

The adapter:

- inherits the generated GrapheneOS/adevtool Panther product at `vendor/google_devices/panther/panther.mk` without modifying it;
- inherits common Sable product composition from `vendor/sable/config/common.mk`;
- keeps `PRODUCT_DEVICE := panther` while using `PRODUCT_NAME := sable_panther` to give Sable its own product identity;
- derives `BUILD_ID_sable_panther` from the generated Panther `cmds-for-envsetup.sh` rather than duplicating or manually overriding the substrate Build ID.

For the GrapheneOS Android 17 envsetup contract, product-specific `cmds-for-envsetup.sh` files are discovered under `vendor/*/<product>/`. The canonical Android checkout path for this repository is therefore:

```text
vendor/sable_devices/sable_panther
```

The intended R6 target invocation is:

```text
lunch sable_panther-cur-user
```

This product wrapper is Panther-specific integration only. Common package selection remains owned by `vendor_sable`.

## Current daily-driver milestone

After Sable Start R6, Panther enters **R7 daily-driver qualification**.

Normative validation requirements:

- [`docs/R7_DAILY_DRIVER_VALIDATION.md`](docs/R7_DAILY_DRIVER_VALIDATION.md)

The R7 baseline covers real runtime validation of:

- incoming/outgoing phone calls;
- contacts workflows;
- SMS and MMS;
- Wi-Fi;
- cellular data;
- Internet/browser access;
- notifications;
- Settings;
- camera/photo flows;
- files;
- clock/alarm;
- calculator;
- access to these applications through Sable Start.

R7 also requires an explicit record of which Phone, Messaging, Contacts, Browser, Camera, Files, Clock, and Calculator implementations are actually selected. Do not infer an AOSP/Graphene/Sable default-app policy from the substrate name alone.

## Boundary documents

- [`docs/PORTING_BOUNDARY.md`](docs/PORTING_BOUNDARY.md)
- [`docs/VALIDATION_MODEL.md`](docs/VALIDATION_MODEL.md)
- [`docs/R7_DAILY_DRIVER_VALIDATION.md`](docs/R7_DAILY_DRIVER_VALIDATION.md)

Device-specific workarounds must have evidence that the problem is actually Panther-specific. A failure observed on Panther is not by itself justification to move common product behavior into this repository.