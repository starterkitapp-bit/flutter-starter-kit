# Project Status

**Last updated:** 2026-11-04  
**Repository:** starterkitapp-bit/flutter-starter-kit  
**Default branch:** main

## Verified repository state

- [x] Public GitHub repository and engineering constitution committed.
- [x] FVM SDK pin committed (.fvmrc: Flutter 3.47.9).
- [x] Dependency graph resolves under the pinned SDK; pubspec.lock is committed.
- [x] Flutter app entry point, Riverpod ProviderScope, GoRouter home/settings routes, and Forui root integration committed.
- [x] Android and iOS native project scaffolds committed.
- [x] Android minimum SDK configured to API 24.
- [x] iOS deployment target configured to 15.0.
- [x] Central spacing, radius, and motion tokens implemented.
- [x] Shared AppSection layout component implemented and used by the settings screen.
- [x] Central Forui neutral mobile Light/Dark theme selection implemented.
- [x] English and Arabic ARB resources and official Flutter gen-l10n committed.
- [x] Arabic RTL, English LTR, and English fallback for unsupported locales covered by widget tests.
- [x] System/Light/Dark and System/English/Arabic settings UI implemented and persisted through SharedPreferencesAsync.
- [x] Settings preferences load before runApp with recovery to System defaults on read failure.
- [x] Reduced-motion scope observes MediaQuery disableAnimations and platform accessibility feature changes.
- [x] Centralized selection haptics gracefully handle unsupported platform channels.
- [x] Shared AppAnimatedSwitcher fade transition implemented with reduced-motion-aware duration.
- [x] Latest quality workflow passed localization generation, formatting, analyzer, and all tests (run 41895664453).
- [x] Latest Android workflow passed localization generation, formatting, analyzer, tests, and debug APK build after haptics (run 41895845304).
- [ ] iOS build executed on macOS/Xcode.

## Latest inspected CI evidence

- [Quality checks after the haptics test correction](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41895664453): passed dependency resolution, gen-l10n, formatting, dart analyze, and tests.
- [Android debug APK after the haptics implementation](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41895845304): passed dependency resolution, gen-l10n, formatting, analysis, tests, and Android APK build.

iOS compilation has not been run because it requires macOS and Xcode.

## Phase tracking

| Phase | Scope | Status |
|---|---|---|
| 0 | SDK pin, dependency audit, lints, structure, config | Foundation committed; quality CI and Android debug APK build pass |
| 1 | Design system, Forui, themes, brand config | Spacing/radius/motion tokens, Forui Light/Dark selection, and AppSection implemented; semantic color/typography tokens and brand configuration remain |
| 2 | Arabic/English localization and RTL | ARB/gen-l10n, runtime language selection, persistence, RTL/LTR, and English fallback implemented |
| 3 | Components, motion, haptics, reduced motion | Motion tokens, reduced-motion scope, haptics, AppSection, and AppAnimatedSwitcher implemented and covered by tests; broader component set remains |
| 4 | Gallery and accessibility validation | Not started |
| 5 | Bootstrap, splash, navigation | Settings load before runApp with recovery; home/settings routes exist; custom splash and deep-link validation remain |
| 6 | Core errors/network/logging/storage/lifecycle | App-specific settings persistence exists; reusable core infrastructure remains |
| 7 | Settings/onboarding | Theme and language settings implemented; onboarding remains optional/not started |
| 8 | Optional authentication | Not started |
| 9 | App template/init workflow, flavors, recipes | Not started |
| 10 | Reference feature | Not started |
| 11 | Second-app reuse validation | Not started |

## Verification boundaries

All repository edits and CI execution have been performed through GitHub; no files or commands were run on the user's device. Linux CI verifies Dart and Android debug builds. It does not establish iOS build readiness; iOS verification still requires a macOS/Xcode runner.

The generated starter bundle identifier is com.starterkitapp.mobilestarterkit. The future app initialization workflow must replace it with each consuming app's own identifier.

## Next engineering actions

1. Finish the minimal shared design-system primitives and accessibility checks.
2. Build the reusable core error taxonomy and Dio networking boundary with focused tests.
3. Continue bootstrap/splash refinement, CI hardening, and remaining phases.
