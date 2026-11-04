# Dependency Policy

## Candidate baseline checked on 2026-11-04

The selected package versions below are published stable releases on pub.dev. The minimum SDK metadata was checked against the package version pages/changelogs. GitHub Actions subsequently confirmed that `flutter pub get` resolves this declared graph under Flutter 3.47.9 (run 41882875527). The generated `pubspec.lock` was not persisted from that ephemeral runner, so the repository still needs a committed lockfile.

| Package | Selected constraint | Minimum SDK evidence |
|---|---:|---|
| flutter_riverpod | ^3.4.3 | Dart 3.12 |
| go_router | ^18.1.2 | Dart 3.12 |
| forui | ^0.27.7 | Dart 3.13 prerelease floor; compatible with Flutter 3.47+ |
| dio | ^5.11.1 | Dart 2.18 |
| shared_preferences | ^2.5.6 | Flutter 3.41 / Dart 3.11 |
| intl | ^0.20.3 | Dart 3.9 |
| very_good_analysis | ^11.0.0 | Dart 3.13 |
| mocktail | ^1.0.5 | Dart 2.12 |

Flutter 3.47.9 bundles Dart 3.13.7. The pinned SDK therefore meets the published Dart minimums listed above. Joint dependency resolution is verified for the CI run noted above. Transitive dependency behavior beyond resolution, analyzer compatibility, tests, and platform builds remain unverified.

## Dependency rules

1. Prefer SDK capabilities when sufficient.
2. Add a package only for an identified requirement.
3. Check publisher, stable release, changelog, SDK constraints, transitive dependencies, license, maintenance, and platform support.
4. Commit pubspec.lock for reproducible application dependency resolution.
5. Recheck versions during planned upgrades and security reviews.
6. Avoid overlapping packages and duplicate responsibilities.
7. Keep optional integrations independently removable.

## Explicit exclusions

Freezed, build_runner, json_serializable, Riverpod code generators, Flutter Hooks/forui_hooks by default, separate Lucide icon package, and mandatory database/Firebase/Supabase/auth/analytics/animation packages.

## Optional dependencies

Secure storage, SVG, cached network images, and Lottie may be introduced only when an implemented feature needs them and the choice is documented.
