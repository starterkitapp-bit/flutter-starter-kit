# Development Guide

## Prerequisites

- Git and FVM.
- Flutter SDK selected by committed .fvmrc (initial pin 3.47.9).
- Android toolchain for Android validation.
- macOS and Xcode for iOS builds and simulator/device validation.

## Local workflow

After the Flutter package scaffold and pubspec.yaml are committed:

1. Select the repository SDK with FVM.
2. Resolve dependencies through FVM.
3. Run formatting and static analysis.
4. Run relevant automated tests.
5. Validate Android with a configured Android toolchain.

Exact commands will be documented with the executable scaffold so they match the committed project structure.

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

## Quality gates

Intended gates: dart format --output=none --set-exit-if-changed ., dart analyze, flutter test, Android build on a suitable environment, and iOS build on macOS/Xcode.

CI will be enabled after a valid Flutter package scaffold and lockfile exist. Do not add a workflow that cannot yet execute meaningful checks just to display a green badge.

## Windows workflow

Android checks can run on Windows when Android SDK/toolchain is configured. Do not claim iOS builds from Windows. The developer launches the app through VS Code; implementation scripts must not launch it automatically.
