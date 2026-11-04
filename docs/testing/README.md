# Testing, Acceptance Criteria, and Definition of Done

A feature is not complete merely because its happy path works. Acceptance is based on behavior, failure handling, tests, quality checks, and documentation appropriate to its risk.

## Feature Definition of Done

Before marking a feature complete, verify all applicable criteria:

- [ ] Requirements and expected behavior are explicit and met.
- [ ] Architecture, dependency direction, and separation of concerns are respected without unnecessary complexity.
- [ ] Naming, formatting, null safety, and static analysis are clean.
- [ ] UI uses the centralized Design System; no duplicate feature-specific styling without justification.
- [ ] Light and Dark themes are correct.
- [ ] English, Arabic, RTL, and LTR behavior are tested where UI is involved.
- [ ] Relevant loading, empty, error, success, disabled, offline, and validation states are handled.
- [ ] Appropriate unit, widget, and integration tests cover success, failure, edge, and regression cases.
- [ ] No known high-severity defect or unresolved regression remains.
- [ ] Performance and lifecycle behavior are reasonable for the feature; claims are measured where necessary.
- [ ] Security and privacy implications are reviewed according to data and capability risk.
- [ ] Documentation, ADRs, and changelog are updated when the change warrants it.

Not every state or test type applies to every feature. Mark non-applicable criteria with a reason during review; never mark them complete without evidence.

## Starter Kit Product Acceptance

These are product-level gates, separate from individual feature acceptance.

- [ ] Clean setup from documented prerequisites is reproducible.
- [ ] Only Android and iOS targets are included and maintained.
- [ ] Light/Dark/System behavior is correct.
- [ ] Arabic/English and RTL/LTR work throughout the app.
- [ ] Feature-First structure and dependency rules are clear and enforced.
- [ ] Riverpod and GoRouter are used consistently without generators.
- [ ] No prohibited code generation or Freezed dependency exists.
- [ ] A complete Design System is implemented and used by a reference feature.
- [ ] Relevant unit/widget/integration tests pass.
- [ ] Android and iOS build/release configurations are validated on suitable environments.
- [ ] Project initialization/setup is documented and reproducible.
- [ ] No critical technical decision is left unresolved without an owner and rationale.
- [ ] Engineering documentation and applicable skills are maintained.

## Test strategy

- Unit: business rules, failure mapping, repositories, formatters, providers, storage, serialization, and lifecycle behavior.
- Widget: shared components, screens, forms, states, navigation, theme, locale, semantics, and text scaling.
- Golden: selected shared components in Light/Dark and English/Arabic/RTL with controlled fonts and environment.
- Integration: startup, navigation, persistence, theme/language changes, forms, errors, and critical platform flows.
- Regression: every fixed defect receives a focused test when practical.

## Verification evidence

A checklist item is complete only when supported by inspected command output or a successful CI run. Documentation, planned workflows, and generated scaffolds are not proof of a working build. Android build success does not imply iOS build success; iOS requires macOS and Xcode.

## Current test inventory

See `test/` and [Project Status](../PROJECT_STATUS.md). Expand coverage with implementation; do not add superficial tests solely to increase test counts.
