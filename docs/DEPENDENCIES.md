# Dependency Policy

## Verified starting snapshot

Package metadata checked against pub.dev on 2026-11-04. These are candidate versions; compatibility and resolution must be confirmed together by Flutter dependency resolution and the committed pubspec.lock.

| Package | Candidate | Purpose | Published minimum SDK evidence |
|---|---:|---|---|
| flutter_riverpod | 3.4.3 | State management | Dart 3.12 |
| go_router | 18.1.2 | Navigation | Dart 3.12 |
| forui | 0.27.7 | UI components | Flutter 3.47.0+; Dart 3.13 prerelease floor shown |
| dio | 5.11.1 | HTTP client | Dart 2.18 |
| shared_preferences | 2.5.6 | Small preferences | Dart 3.11 |
| intl | 0.20.3 | Localization/formatting | Dart 3.9 |
| very_good_analysis | 11.0.0 | Static analysis | Dart 3.13 |
| mocktail | 1.0.5 | Tests without code generation | Dart 2.12 |

Flutter 3.47.9 is the initial SDK pin. Forui 0.26.0+ requires Flutter 3.47.0+. Resolve the selected versions together before depending on them in app code.

## Dependency rules

1. Prefer SDK capabilities when sufficient.
2. Add a package only for an identified requirement.
3. Check publisher, stable release, changelog, SDK constraints, transitive dependencies, license, maintenance, and platform support.
4. Commit pubspec.lock for reproducible application resolution.
5. Recheck versions during planned upgrades and security reviews.
6. Avoid overlapping packages and duplicate responsibilities.
7. Keep optional integrations independently removable.

## Explicit exclusions

Freezed, build_runner, json_serializable, Riverpod code generators, Flutter Hooks/forui_hooks by default, separate Lucide icon package, and mandatory database/Firebase/Supabase/auth/analytics/animation packages.

## Optional dependencies

Secure storage, SVG, cached network images, and Lottie may be introduced only when an implemented feature needs them and the choice is documented.
