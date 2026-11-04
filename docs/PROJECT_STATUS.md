# Project Status

**Last updated:** 2026-11-04  
**Repository:** starterkitapp-bit/flutter-starter-kit  
**Default branch:** main

## Verified repository state

- [x] Public GitHub repository exists; default branch is main.
- [x] Engineering constitution and core project documentation committed.
- [x] FVM SDK pin committed (.fvmrc: Flutter 3.47.9).
- [x] Declared dependency graph resolves under the pinned SDK; pubspec.lock is committed.
- [x] Initial Flutter app, ProviderScope, GoRouter home route, and Forui root integration committed.
- [x] Android and iOS native project scaffolds generated and committed.
- [x] Android minimum SDK configured to API 24.
- [x] iOS deployment target configured to 15.0.
- [x] Android debug APK build passed in GitHub Actions (run 41887018234).
- [x] Central spacing, radius, and motion tokens implemented.
- [x] Central Forui neutral mobile Light/Dark theme selection implemented.
- [x] English and Arabic ARB resources committed.
- [x] Official Flutter gen-l10n configured; generated Dart localization sources are committed.
- [x] Arabic RTL and English LTR behavior covered by widget tests.
- [x] Unsupported device locales explicitly fall back to English and are covered by a widget test.
- [x] GitHub Actions resolves dependencies, generates localization sources, formats Dart, analyzes, and tests.
- [x] Main-branch formatter output and generated localization sources are persisted by a separate write-permission job.
- [x] Pull-request quality job runs without repository write permissions.
- [ ] Android debug build re-verified after the latest localization and fallback changes.
- [ ] iOS build executed on macOS/Xcode.

## Latest inspected CI evidence

- [Android scaffold and debug build](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41887018234): passed, including native project generation, dependency resolution, formatting, analysis, tests, and Android debug APK build.
- [Localization quality run](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41887933561): passed, including `flutter gen-l10n`, formatting, `dart analyze`, and widget tests for English and Arabic RTL.
- [Locale fallback quality run](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41888262831): passed, including the unsupported-locale-to-English fallback test.

The latest Android rebuild after the current localization changes is tracked separately in GitHub Actions. iOS compilation has not been run because it requires macOS and Xcode.

## Phase tracking

| Phase | Scope | Status |
|---|---|---|
| 0 | SDK pin, dependency audit, lints, structure, config | Foundation committed; CI quality gates and initial Android debug build pass |
| 1 | Design system, Forui, themes, brand config | Spacing/radius/motion tokens and centralized Forui Light/Dark selection implemented; brand configuration and component system remain |
| 2 | Arabic/English localization and RTL | ARB/gen-l10n, locale delegates, RTL/LTR, and English fallback implemented; persisted user language preference remains |
| 3 | Components, motion, haptics, reduced motion | Shared motion reference tokens only; component library, haptics, and reduced-motion behavior remain |
| 4 | Gallery and accessibility validation | Not started |
| 5 | Bootstrap, splash, navigation | Initial GoRouter home route only; robust bootstrap, native splash refinement, and deep-link validation remain |
| 6 | Core errors/network/logging/storage/lifecycle | Not started |
| 7 | Settings/onboarding if required | Theme/language preference UI and persistence remain |
| 8 | Optional authentication | Not started |
| 9 | App template/init workflow, flavors, recipes | Not started |
| 10 | Reference feature | Not started |
| 11 | Second-app reuse validation | Not started |

## Verification boundaries

All repository edits and CI execution have been performed through GitHub; no files or commands were run on the user's device. Linux CI verifies Dart and Android debug builds. It does not establish iOS build readiness; iOS verification still requires a macOS/Xcode runner.

The generated starter bundle identifier is `com.starterkitapp.mobilestarterkit`. The future app initialization workflow must replace it with each consuming app's own identifier.

## Next engineering actions

1. Complete Android debug rebuild verification against the latest localization changes.
2. Implement persisted System/Arabic/English and System/Light/Dark preferences, with a small Forui settings surface.
3. Complete the design system's semantic tokens and shared component foundations.
4. Build out startup/bootstrap recovery and native splash behavior.
5. Continue with accessibility, motion/reduced-motion, core infrastructure, CI hardening, and the remaining phases.
