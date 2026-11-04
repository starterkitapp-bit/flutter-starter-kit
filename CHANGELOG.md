# Changelog

Notable changes to the starter kit are recorded here. This project is under active development; entries do not imply release readiness.

## 2026-11-05 — Unreleased

- Unified Material `ThemeData` with the centralized Forui neutral Light/Dark palette and typography; added regression tests for both brightness modes. Quality checks and Android debug APK build passed (quality run [41931293879](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41931293879); Android run [41931508513](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41931508513)).

- Verified the Android debug APK after the logging implementation, including dependency resolution, localization generation, formatting, analysis, and tests (run [41927228830](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41927228830)).
- Added a dependency-free AppLogger that redacts sensitive message/context/stack-trace data before output and avoids retaining raw exception messages.
- Added focused logging tests for credentials, personal data, nested context, disabled output, and unsupported object values.
- Verified formatting, analysis, and Flutter tests for the logging implementation (run [41926709789](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41926709789)); Android APK verification also passed (run [41927228830](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41927228830)).

## 2026-11-04 — Unreleased

- Established Flutter/Dart Android+iOS foundation with FVM pin, Riverpod, GoRouter, and Forui.
- Added Arabic/English localization, RTL/LTR behavior, theme and language preferences.
- Added initial design tokens, shared section layout, reduced-motion support, haptics, and animated switcher.
- Added transport-independent core failure types and tests.
- Added shared Dio configuration and centralized transport-failure mapping with focused tests; retries remain opt-in pending idempotency policy.
- Added GitHub quality workflow and Android debug build workflow.
- Guarded Android verification against stale quality runs when `main` advances.
- Reorganized engineering documentation around architecture, design system, standards, testing, security, and platform responsibilities.
