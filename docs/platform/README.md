# Platform Engineering: Android and iOS

## Supported targets

- Android: minimum API 24.
- iOS: minimum deployment target 15.0.
- Web and desktop targets are out of scope unless the foundation decision is formally revised.

## SDK and renderer

Use the Flutter SDK pinned in `.fvmrc` through FVM. Upgrade through deliberate compatibility/security review, not arbitrary version drift. Do not force renderer flags; follow Flutter's platform defaults unless profiling or a documented platform issue justifies a change.

## Android

The repository includes an Android project scaffold with minimum SDK configured to API 24. Android CI currently performs a debug APK build. Release readiness still requires review of application ID, product flavors if used, permissions, target SDK policy, signing, AAB generation, symbols/obfuscation, and store requirements.

## iOS

The repository includes an iOS project scaffold with deployment target configured to 15.0. A valid iOS build/archive and simulator/device validation require macOS and Xcode. Do not infer iOS build success from Dart analysis, widget tests, or Android builds.

Release readiness requires review of bundle identifier, schemes/configurations, signing/provisioning, entitlements, privacy usage descriptions, archive, symbols, and store requirements.

## Shared platform behavior

- Preserve native-feeling navigation and back behavior, including iOS back gestures and Android predictive back where supported.
- Respect safe areas, keyboard insets, app lifecycle, platform accessibility settings, and permission denial.
- Add native permissions, plugins, and platform code only for a real feature consumer.
- Keep optional platform capabilities independently removable.

## Verification record

See [Project Status](../PROJECT_STATUS.md) for exact CI runs and verified boundaries. Every platform claim must identify the platform, build type, SDK/toolchain, and successful evidence.
