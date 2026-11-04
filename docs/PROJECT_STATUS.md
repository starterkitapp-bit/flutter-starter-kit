# Project Status

**Last updated:** 2026-11-05  
**Repository:** starterkitapp-bit/flutter-starter-kit  
**Default branch:** main

## Verified implementation

- [x] Flutter/Dart foundation with FVM pin 3.47.9 and committed dependency lockfile.
- [x] Android and iOS native project scaffolds; Android min API 24 and iOS deployment target 15.0.
- [x] Riverpod root, GoRouter home/settings routes, and Forui root integration.
- [x] Central spacing, radius, and motion tokens; shared AppSection.
- [x] Forui neutral Light/Dark theme selection.
- [x] Arabic/English ARB resources and official gen-l10n.
- [x] Arabic RTL, English LTR, unsupported-locale fallback, and widget tests.
- [x] System/Light/Dark and System/English/Arabic settings, persisted through SharedPreferencesAsync.
- [x] Startup settings load before runApp with safe System defaults on read failure.
- [x] Reduced-motion scope, centralized haptics, and reduced-motion-aware AppAnimatedSwitcher.
- [x] Transport-independent Failure taxonomy for network, timeout, auth/permission, validation, conflict, rate limit, server, cancellation, and unknown cases.
- [x] Central Dio client factory with bounded timeouts and environment-supplied base URL.
- [x] Dio exception mapping to the central Failure taxonomy, including safe HTTP status and numeric Retry-After handling.
- [x] Central AppLogger with redaction before output, nested-context sanitization, error-type-only diagnostics, and injectable writer.
- [x] Logging tests cover secret/token/email redaction, nested context, stack traces, disabled logging, and unsupported objects.
- [x] Quality workflow passed dependency resolution, localization generation, formatting, analysis, and tests for the logging implementation (run [41926709789](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41926709789)).
- [x] Android debug APK built successfully with formatting, analysis, and tests after the Dio networking change (run [41922332071](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41922332071)); a build after the new logging code is pending.
- [ ] iOS build on macOS/Xcode.

## Phase tracking

| Phase | Scope | Status |
|---|---|---|
| 0 | SDK, dependencies, lints, structure, CI | Foundation, quality CI, and Android debug APK pass |
| 1 | Design System, themes, brand config | Core tokens, Forui Light/Dark, and AppSection exist; semantic app color/typography extensions and brand config remain |
| 2 | Arabic/English, RTL, fonts | ARB/gen-l10n, runtime selection, persistence, RTL/LTR, fallback implemented; licensed bundled fonts remain |
| 3 | Components, motion, haptics | AppSection, AppAnimatedSwitcher, reduced-motion scope, and haptics implemented; broader component library remains |
| 4 | Gallery and accessibility | Not started |
| 5 | Bootstrap, splash, navigation | Settings load before runApp and home/settings routes exist; custom splash/deep-link validation remain |
| 6 | Core infrastructure | Failure taxonomy, Dio client, failure mapping, and redacted AppLogger implemented; reusable storage and lifecycle remain |
| 7 | Settings/onboarding | Theme/language settings implemented; onboarding remains optional |
| 8 | Optional authentication | Not started |
| 9 | App template/init workflow, flavors, recipes | Not started |
| 10 | Reference feature | Not started |
| 11 | Second-app reuse validation | Not started |

## Verification boundaries

All repository edits and CI execution are performed through GitHub; no files or commands have been run on the user's device. The logging implementation passed formatting, analysis, and all Flutter tests (run [41926709789](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41926709789)). The latest successful Android verification before logging passed formatting, analysis, tests, and debug APK build (run [41922332071](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41922332071)); Android APK verification after logging is pending. iOS compilation has not been run; it requires macOS and Xcode.

The current scaffold identifier is com.starterkitapp.mobilestarterkit. The future app initialization workflow must replace it with each consuming app's own identifier.

## Next actions

1. Re-run Android debug APK verification with the logging implementation included.
2. Continue reusable storage and lifecycle infrastructure, then design-system foundations and accessibility coverage.
3. Add iOS CI on macOS when an appropriate runner is available.
