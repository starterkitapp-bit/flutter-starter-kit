# Flutter Starter Kit

A reusable, production-oriented Flutter and Dart foundation for **Android and iOS** applications.

> Build it right. Keep it clean. Make it last.

This repository is a starter kit, not a finished consumer app. Its purpose is to provide a small, coherent foundation that can be branded and configured for multiple independent mobile products without editing shared Core infrastructure or the Design System.

## Product boundaries

- Platforms: Android and iOS only. No web or desktop targets.
- Languages: Arabic and English, including correct RTL/LTR behavior.
- Appearance: System, Light, and Dark preferences.
- Navigation: GoRouter.
- State management: Riverpod 3, used manually without generators.
- UI foundation: Forui, integrated deliberately with Flutter platform behavior.
- Architecture: pragmatic feature-first; add layers only where they establish a real boundary.
- Code generation: prohibited, except Flutter's official gen-l10n localization generation.
- No Freezed, build_runner, json_serializable, or generated Riverpod providers.

## Engineering principles

- Prefer evidence, explicit decisions, and verified behavior over assumptions.
- Optimize for maintainability, accessibility, reliability, security, and performance.
- Avoid unnecessary packages, abstractions, configuration switches, placeholder features, and duplicated sources of truth.
- Keep branding and environment configuration separate.
- Keep optional product capabilities independently removable.
- Do not claim a build, test, or platform validation passed without recorded evidence.

## Repository guide

- [Engineering Constitution](CLAUDE_FINAL.md) — locked product and engineering baseline.
- [Architecture](docs/ARCHITECTURE.md) — boundaries and dependency direction.
- [Design System](docs/DESIGN_SYSTEM.md) — visual, theme, and motion principles.
- [Development](docs/DEVELOPMENT.md) — local workflow and contribution rules.
- [Dependencies](docs/DEPENDENCIES.md) — package policy and verified starting snapshot.
- [Project Status](docs/PROJECT_STATUS.md) — implementation and verification status.
- [Quality Checklist](docs/QUALITY_CHECKLIST.md) — acceptance and review gates.

## Current status

The repository has been initialized and its engineering foundation is being established. A document or decision in this repository is not evidence that the corresponding feature has been implemented or tested. See [Project Status](docs/PROJECT_STATUS.md).

## License

License selection is intentionally pending. Do not assume this project is open for unrestricted reuse until a license is added.
