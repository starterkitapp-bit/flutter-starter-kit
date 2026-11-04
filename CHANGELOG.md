# Changelog

Notable changes to the starter kit are recorded here. This project is under active development; entries do not imply release readiness.

## 2026-11-05 — Unreleased

- Verified the current GitHub quality workflow and Android debug APK build after the Dio networking change.
- Added a dependency-free AppLogger that redacts sensitive message/context/stack-trace data before output and avoids retaining raw exception messages.
- Added focused logging tests for credentials, personal data, nested context, disabled output, and unsupported object values.
- Verified formatting, analysis, and Flutter tests for the logging implementation (run [41926709789](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41926709789)); Android APK verification after this addition remains pending.

## 2026-11-04 — Unreleased

- Established Flutter/Dart Android+iOS foundation with FVM pin, Riverpod, GoRouter, and Forui.
- Added Arabic/English localization, RTL/LTR behavior, theme and language preferences.
- Added initial design tokens, shared section layout, reduced-motion support, haptics, and animated switcher.
- Added transport-independent core failure types and tests.
- Added shared Dio configuration and centralized transport-failure mapping with focused tests; retries remain opt-in pending idempotency policy.
- Added GitHub quality workflow and Android debug build workflow.
- Guarded Android verification against stale quality runs when `main` advances.
- Reorganized engineering documentation around architecture, design system, standards, testing, security, and platform responsibilities.
