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
- [x] Android debug APK build passed for the native scaffold and localization baseline (runs 41887018234 and 41888496679).
- [x] Central spacing, radius, and motion tokens implemented.
- [x] Central Forui neutral mobile Light/Dark theme selection implemented.
- [x] English and Arabic ARB resources and official Flutter gen-l10n committed.
- [x] Arabic RTL, English LTR, and English fallback for unsupported locales covered by widget tests.
- [x] System/Light/Dark and System/English/Arabic settings UI implemented.
- [x] Theme and language preferences persist through SharedPreferencesAsync and load before runApp.
- [x] Settings store/controller unit tests and settings route widget test pass.
- [x] Latest quality workflow passed formatting, localization generation, dart analyze with zero issues, and all tests (run 41890143955).
- [ ] Android debug build re-verification after settings implementation is currently running (run 41890374818).
- [ ] iOS build executed on macOS/Xcode.

## Latest inspected CI evidence

- [Android scaffold and initial debug build](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41887018234): passed.
- [Android build with localization and fallback](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41888496679): passed.
- [Settings implementation quality run](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41890143955): passed dependency resolution, gen-l10n, formatting, analyzer, and tests.
- [Android build with settings implementation](https://github.com/starterkitapp-bit/flutter-starter-kit/actions/runs/41890374818): in progress at the time of this update.

iOS compilation has not been run because it requires macOS and Xcode.

## Phase tracking

| Phase | Scope | Status |
|---|---|---|
| 0 | SDK pin, dependency audit, lints, structure, config | Foundation committed; quality CI passes; Android debug builds have passed on earlier baselines |
| 1 | Design system, Forui, themes, brand config | Spacing/radius/motion tokens and centralized Forui Light/Dark selection implemented; semantic color/typography tokens and brand configuration remain |
| 2 | Arabic/English localization and RTL | ARB/gen-l10n, runtime language selection, persistence, RTL/LTR, and English fallback implemented |
| 3 | Components, motion, haptics, reduced motion | Motion reference tokens only; shared components, haptics, and reduced-motion behavior remain |
| 4 | Gallery and accessibility validation | Not started |
| 5 | Bootstrap, splash, navigation | Settings are loaded before runApp with recovery to System defaults; home/settings routes exist; custom splash and deep-link validation remain |
| 6 | Core errors/network/logging/storage/lifecycle | App-specific settings persistence exists; reusable core infrastructure remains |
| 7 | Settings/onboarding | Theme and language settings implemented; onboarding remains optional/not started |
| 8 | Optional authentication | Not started |
| 9 | App template/init workflow, flavors, recipes | Not started |
| 10 | Reference feature | Not started |
| 11 | Second-app reuse validation | Not started |

## Verification boundaries

All repository edits and CI execution have been performed through GitHub; no files or commands were run on the user's device. Linux CI verifies Dart and Android debug builds. It does not establish iOS build readiness; iOS verification still requires a macOS/Xcode runner.

The generated starter bundle identifier is `com.starterkitapp.mobilestarterkit`. The future app initialization workflow must replace it with each consuming app's own identifier.

## Next engineering actions

1. Confirm Android debug build with the settings implementation.
2. Complete semantic design tokens and shared Forui component foundations.
3. Implement reduced-motion handling, purposeful transitions, and haptics.
4. Add robust reusable core error/network/logging/lifecycle infrastructure.
5. Continue accessibility validation, bootstrap/splash refinement, CI hardening, and remaining phases.
