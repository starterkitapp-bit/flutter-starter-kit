# Flutter Starter Kit

A reusable, production-oriented Flutter and Dart foundation for **Android and iOS** applications.

> Build it right. Keep it clean. Make it last.

This repository is a starter kit, not a finished consumer app. It provides a coherent foundation that can be branded and configured for multiple independent mobile products without editing shared Core infrastructure or the Design System.

## Fixed product baseline

- Flutter and Dart; Android + iOS only.
- Arabic + English, with RTL/LTR support.
- Light + Dark themes, with System preference.
- Feature-First architecture, applying SOLID and separation of concerns pragmatically.
- GoRouter for navigation; Riverpod for state management.
- Centralized custom Design System.
- Code generation prohibited, except Flutter's official `gen-l10n`.
- Freezed, build_runner, json_serializable, and generated Riverpod providers prohibited.

A foundational decision may change only through explicit review and an accepted ADR. See [Engineering Constitution](CLAUDE_FINAL.md).

## Engineering principles

- Think before coding; define scope, acceptance criteria, and failure cases.
- Prefer the smallest maintainable solution that solves a real problem.
- Keep shared decisions centralized without collapsing separate responsibilities into one file or module.
- Prevent circular dependencies, feature coupling, duplicated styles, hidden state, and unnecessary abstractions.
- Review security, privacy, accessibility, localization, performance, platform behavior, and reliability according to feature risk.
- Treat tests and CI evidence as the source of truth; documentation is not proof of implementation.
- Update documentation and project status when meaningful behavior or decisions change.

## Repository guide

- [Architecture](docs/architecture/README.md) — boundaries, dependency rules, and feature-first structure.
- [Design System](docs/design-system/README.md) — tokens, components, themes, patterns, and motion.
- [Engineering Standards](docs/standards/README.md) — coding, naming, SOLID, dependency, and development rules.
- [Testing and Definition of Done](docs/testing/README.md) — feature acceptance and product acceptance.
- [Security and Privacy](docs/security/README.md) — security baseline and threat review.
- [Platform Engineering](docs/platform/README.md) — Android/iOS configuration and validation limits.
- [Architecture Decisions](docs/decisions/) — accepted ADRs and rationale.
- [Project Status](docs/PROJECT_STATUS.md) — implementation progress and verified evidence.
- [Changelog](CHANGELOG.md) — notable repository changes.
- [Engineering Constitution](CLAUDE_FINAL.md) — locked requirements and long-term constraints.

## Current status

The starter foundation is under active implementation. See [Project Status](docs/PROJECT_STATUS.md). A documented requirement is not considered implemented until code and verification evidence exist.

## License

License selection is intentionally pending. Do not assume unrestricted reuse until a license is added.
