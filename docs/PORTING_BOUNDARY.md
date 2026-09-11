# Panther porting boundary

Panther is the current primary SableOS reference target, but Panther-specific code must remain narrowly scoped.

## Upstream-owned

The GrapheneOS/Google Panther substrate remains responsible for the normal device tree, kernel/vendor integration, partition model, hardware support, and Android platform behavior unless a Sable-specific change is explicitly justified.

## Sable-owned Panther layer

This repository may contain only Panther-specific Sable integration that cannot remain common, such as bounded target overlays, product hooks, policy additions, or compatibility glue.

## Rejected pattern

Do not copy common Sable applications, services, or platform policy into this repository. A Panther-only fix to common product behavior is a signal that the abstraction boundary should be reviewed.

## Migration rule

Before moving existing Panther-specific changes here, classify every file as common product, common platform, build tooling, or truly target-specific. Do not migrate by directory name alone.
