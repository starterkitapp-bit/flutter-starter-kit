# Dependency Policy

## Selected baseline

The current declared starting constraints are recorded in `pubspec.yaml` and the exact resolved versions in `pubspec.lock`. The baseline package set includes Riverpod, GoRouter, Forui, Dio, Shared Preferences, intl, very_good_analysis, and Mocktail. Version constraints are not permanent; recheck current stable releases, SDK requirements, compatibility, licenses, and maintenance before upgrades.

## Review requirements

1. Confirm the package solves an identified requirement not adequately served by the SDK or existing dependencies.
2. Review publisher/maintainer, stable release history, changelog, SDK constraints, platform support, transitive dependencies, license, and security posture.
3. Resolve the full graph with the pinned Flutter SDK.
4. Run formatting, analysis, tests, and applicable Android/iOS builds.
5. Commit the lockfile and document consequential dependency decisions.
6. Avoid overlapping packages, duplicate responsibilities, and packages added only for hypothetical future features.

## Prohibited/default-excluded packages

Do not add Freezed, build_runner, json_serializable, generated Riverpod providers, or custom code-generation tooling. Flutter's official `gen-l10n` is the only allowed generation workflow.

Do not add Flutter Hooks/forui_hooks, a separate Lucide icon package, or mandatory database/Firebase/Supabase/auth/analytics/animation packages by default.

## Optional dependencies

Secure storage, SVG, cached network images, and Lottie may be introduced only when an implemented feature needs them and their compatibility/security implications have been reviewed.
