# Panther porting boundary

Status: **current frozen-reference boundary — 2026-09-24**

Panther / Pixel 7 is the physically accepted R9 touch-first reference and is now
`REFERENCE_FROZEN`.

Panther-specific code must remain narrowly scoped.

## Upstream substrate ownership

The Google/GrapheneOS-derived Panther substrate remains responsible for normal
device tree, kernel/vendor integration, partition model, hardware support and
Android platform behavior unless a Sable-specific change is explicitly
justified.

## Sable Panther ownership

This repository may contain only Panther-specific Sable integration that cannot
remain common, such as bounded target overlays, product hooks, policy additions
or compatibility glue.

Do not copy common Sable apps/services/platform semantics here.

## Frozen-reference rule

New product design is not driven by Panther by default. A common feature may be
regression-tested on Panther, but that does not make Panther the active feature
target.

Security-critical or common-regression maintenance may still justify bounded
Panther changes.

## Portability signal

A workaround that appears on Panther but expresses common product behavior is a
signal to review the abstraction boundary, not a reason to create a Panther-only
fork.

Titan 2 / Titan 2 Elite have independent adapters and evidence. Panther runtime,
camera, telephony, display or flash PASS never substitutes for Titan evidence.
