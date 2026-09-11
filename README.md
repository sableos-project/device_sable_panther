# SableOS Panther integration

SableOS-specific integration for Google Pixel 7 (`panther`).

This repository is an adapter layer. It must not duplicate the upstream GrapheneOS/Google Panther device tree or common Sable application/platform source.

## Current substrate

- device: Pixel 7 (`panther`)
- Android baseline: Android 17
- upstream substrate: GrapheneOS `2026081300`
- current role: primary product-development and validation reference

## Repository intent

Only Sable-owned Panther-specific integration that cannot remain in common repositories should live here. Examples may include target-specific product hooks, overlays, SELinux additions, or compatibility glue justified by Panther behavior.

The existing validated Panther workspace remains the active build evidence source until organization migration and clean reconstruction are closed.

See `docs/PORTING_BOUNDARY.md` and `docs/VALIDATION_MODEL.md`.
