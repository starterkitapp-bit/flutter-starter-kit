# Changelog

Notable changes to the starter kit are recorded here. This project is under active development; entries do not imply release readiness.

## 2026-11-05 — Unreleased

- Verified the current GitHub quality workflow and Android debug APK build after the Dio networking change.

## 2026-11-04 — Unreleased

- Established Flutter/Dart Android+iOS foundation with FVM pin, Riverpod, GoRouter, and Forui.
- Added Arabic/English localization, RTL/LTR behavior, theme and language preferences.
- Added initial design tokens, shared section layout, reduced-motion support, haptics, and animated switcher.
- Added transport-independent core failure types and tests.
- Added shared Dio configuration and centralized transport-failure mapping with focused tests; retries remain opt-in pending idempotency policy.
- Added GitHub quality workflow and Android debug build workflow.
- Guarded Android verification against stale quality runs when `main` advances.
- Reorganized engineering documentation around architecture, design system, standards, testing, security, and platform responsibilities.
