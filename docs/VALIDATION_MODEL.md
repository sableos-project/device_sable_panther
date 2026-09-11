# Panther validation model

Panther remains the primary physical validation target for current SableOS development.

## Evidence progression

Changes should be qualified in layers:

1. exact source identity and bounded diff;
2. static/pre-build checks;
3. module or affected-target build;
4. artifact/package inspection;
5. controlled device deployment when separately authorized;
6. runtime/interaction validation;
7. provider/hardware behavior validation;
8. regression and recovery validation for broader system changes.

## Claim discipline

Compilation does not prove runtime correctness. A working preview Activity does not prove HOME-role adoption or SystemUI replacement. One launch timing does not establish performance. Provider package presence does not prove user data correctness.

## Current R3 state

The active Sable Start R3 source delta has been applied to the validated Panther workspace. Pre-build and pure-model checks passed. The module-scoped Soong/Kotlin compile/type-check gate is the next evidence boundary; device installation/runtime revalidation follows only after a successful build and controlled install.
