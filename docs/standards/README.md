# Engineering and Coding Standards

## Decision hierarchy

1. The locked [Engineering Constitution](../../CLAUDE_FINAL.md) and accepted ADRs define the baseline.
2. Architecture, Design System, Testing, Security, and Platform documents define implementation standards.
3. Feature-specific acceptance criteria refine behavior without silently overriding foundational rules.

If a new requirement conflicts with a fixed decision, stop and review the baseline formally. Record consequential changes in an ADR before implementation.

## Engineering approach

- Think before coding: state the goal, scope, constraints, acceptance criteria, and failure cases.
- Simplicity first: choose the smallest adequate solution.
- Surgical changes: avoid unrelated edits and speculative refactoring.
- Goal-driven execution: every dependency, file, abstraction, and configuration option must serve a real requirement.
- Evidence over intuition: verify compatibility and inspect actual test/build output.
- Quality over quantity; maintainability over shortcuts; reuse over duplication.
- Do not leave fake functionality, dead code, temporary workarounds, or empty placeholder directories.

## Dart and Flutter coding

- Keep null safety and strict analyzer settings enabled.
- Avoid unnecessary `dynamic`, raw types, force unwraps, and ambiguous names.
- Prefer immutable state and `final`; use `const` where it improves clarity and efficiency.
- Follow consistent package imports and Flutter/Dart formatting.
- Handle asynchronous errors, cancellation, disposal, and widget lifecycle correctly.
- Avoid hidden global state, unawaited work without intent, and `print` debugging.
- Extract meaningful widgets/classes; do not split every trivial expression into helpers.
- File/build-method size is a review signal, not an arbitrary hard limit.

## SOLID and separation of concerns

Apply SOLID pragmatically. Do not create an interface for every implementation, add layers without a responsibility, or turn shared folders into miscellaneous storage. Keep UI, domain policy, data access, and platform infrastructure separated according to actual change boundaries.

## State and navigation

Use Riverpod 3 manually; no generated providers. Use `ref.watch` for reactive dependencies, `ref.read` for event handling, and `ref.listen` for side effects. Avoid duplicate state and oversized providers. Keep GoRouter definitions and route policy in `app/navigation/`, not widgets or Core.

## Localization and accessibility

No user-facing strings hardcoded in feature widgets. Edit ARB resources and use generated localization accessors. Use directional layout primitives, support Arabic RTL and English LTR, and test text scaling, semantics, screen readers, contrast, focus, and reduced motion.

## Dependency and code-generation policy

Add packages only for a concrete requirement after reviewing publisher, stable release, SDK constraints, changelog, transitive dependencies, license, maintenance, and platform support. Keep `pubspec.lock` committed and review upgrades deliberately.

Code generation is prohibited except Flutter's official `gen-l10n` from ARB files. Do not add Freezed, build_runner, json_serializable, generated Riverpod providers, or substitute custom generators.

## Development workflow

Use the Flutter SDK pinned in `.fvmrc` through FVM. Standard verification:

1. `fvm install`
2. `fvm flutter pub get`
3. `fvm flutter gen-l10n`
4. `fvm dart format --output=none --set-exit-if-changed .`
5. `fvm dart analyze`
6. `fvm flutter test`

Read the constitution and relevant ADRs before foundational changes. Update docs/status after meaningful implementation or decision changes. A checked checklist item requires evidence.

## CI and contribution rules

GitHub Actions uses the pinned SDK to resolve dependencies, generate localization, format, analyze, and test. Native workflows validate Android builds; iOS requires macOS/Xcode. Keep changes focused, commits meaningful, and secrets/build artifacts/local SDK caches/backups out of Git.
