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
3. `fvm dart format --output=none --set-exit-if-changed .`
4. `fvm dart analyze`
5. `fvm flutter test`

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

## Continuous integration

The GitHub Actions quality workflow reads the Flutter version from .fvmrc, resolves dependencies, checks formatting, runs dart analyze, and runs Flutter tests. Platform builds will be added once the native Android/iOS project scaffolds exist.

## Windows workflow

Android checks can run on Windows when Android SDK/toolchain is configured. Do not claim iOS builds from Windows. The developer launches the app through VS Code; implementation scripts must not launch the app automatically.
