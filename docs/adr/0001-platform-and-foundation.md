# ADR 0001: Platform and Foundation Baseline

- Status: Accepted
- Date: 2026-11-04

## Context

The starter must be reusable across independent mobile apps while keeping its foundation focused, maintainable, and verifiable.

## Decisions

- Flutter/Dart; Android and iOS only.
- Initial FVM SDK pin: Flutter 3.47.9.
- Android minimum API 24; iOS minimum deployment target 15.0.
- Arabic/English, including RTL/LTR.
- Light, Dark, and System theme preferences.
- GoRouter for navigation.
- Riverpod 3 for application state.
- Forui as primary UI component foundation.
- Feature-first organization with selective layering.
- No code generation except official Flutter gen-l10n.

## Consequences

Platform configuration, brand configuration, app environment, navigation, and shared infrastructure remain separate. Dependencies must be verified together and resolved into a committed lockfile. iOS build claims require macOS/Xcode.

## Revisit when

A platform requirement changes, an SDK/security issue requires an upgrade, or measured product needs invalidate a selected foundation dependency.
