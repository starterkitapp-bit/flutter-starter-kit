# Development Guide

## Prerequisites

- Git and FVM.
- Flutter SDK selected by committed .fvmrc (initial pin 3.47.9).
- Android toolchain for Android validation.
- macOS and Xcode for iOS builds and simulator/device validation.

## Local workflow

From the repository root, use the FVM-selected SDK:

1. `fvm install`
2. `fvm flutter pub get`
3. `fvm flutter gen-l10n`
4. `fvm dart format --output=none --set-exit-if-changed .`
5. `fvm dart analyze`
6. `fvm flutter test`

Do not use a different global Flutter version for this repository. Commit the resolved pubspec.lock after dependency resolution.

## Working agreements

- Read the constitution and relevant ADR before changing foundational behavior.
- Define goal, scope, acceptance criteria, and failure cases before implementation.
- Make focused, coherent changes; avoid unrelated refactoring.
- Prefer one clear implementation over speculative abstractions.
- No generated code except official Flutter gen-l10n.
- No Freezed, build_runner, json_serializable, or Riverpod generators.
- Do not add dependencies without a concrete use case and compatibility/license review.
- Update docs and status when decisions or implementation state change.
- Never report tests/builds as passing unless actual output has been inspected.

## Localization and settings

- Edit source translations in `lib/app/localization/arb/`.
- English is the template; every supported locale must define the same message keys.
- Generated Dart localization sources belong in `lib/app/localization/generated/` and are produced only by Flutter's official `gen-l10n` command.
- The language setting supports System, English, and Arabic. System removes the persisted override and follows the device locale.
- The appearance setting supports System, Light, and Dark.
- Preferences are loaded before `runApp` and exposed through Riverpod. Small non-sensitive values use `SharedPreferencesAsync` via `AppSettingsStore`; never store credentials or secrets there.
- If settings cannot be read at startup, the app reports the error and starts with safe System defaults.
- Do not edit generated localization files by hand.

## Continuous integration

The GitHub Actions quality workflow reads the Flutter version from .fvmrc, resolves dependencies, generates localization sources, checks formatting, runs dart analyze, and runs Flutter tests. Android/iOS scaffold and Android debug build verification are handled by the native workflow. iOS builds require macOS and Xcode.

## Windows workflow

Android checks can run on Windows when Android SDK/toolchain is configured. Do not claim iOS builds from Windows. The developer launches the app through VS Code; implementation scripts must not launch the app automatically.
