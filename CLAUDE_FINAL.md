# STARTER_KIT — FINAL ENGINEERING CONSTITUTION

**Version:** 4.0  
**Status:** Locked baseline  
**Date adopted:** 2026-11-04

> Build it right. Keep it clean. Make it last.

This file records the locked engineering and product baseline for the reusable Flutter Starter Kit. It defines what must be built and how it must be judged. It is not evidence that implementation, testing, builds, or release acceptance have passed. SDK and package versions are time-sensitive and must be rechecked against official sources and the resolved lockfile.

## 1. Mission and product boundaries

Build a reusable, production-oriented Flutter/Dart foundation for creating independent mobile apps. This is a starter kit, not a finished consumer application. Supported platforms are Android and iOS only. Web, Windows, macOS, and Linux are out of scope unless explicitly approved later.

Baseline capabilities: Arabic and English, Arabic RTL and English LTR, and complete Light/Dark themes with System preference. Prioritize maintainability, simplicity, consistency, accessibility, security, reliability, and measured performance over feature count or visual effects.

## 2. Non-negotiable engineering rules

1. Think before coding: define goal, scope, constraints, acceptance criteria, and failure modes.
2. Simplicity first: choose the smallest design that solves the actual problem.
3. Surgical changes: avoid unrelated edits and unnecessary churn.
4. Goal-driven execution: every file, dependency, abstraction, and feature must serve an identified requirement.
5. Quality over quantity; maintainability over shortcuts; reuse over duplication.
6. Evidence over intuition. Verify important claims, compatibility, builds, and tests.
7. Never report implementation, tests, or builds as successful without evidence.
8. No AI slop, AI clutter, fake functionality, decorative architecture, dead code, or empty placeholder directories.
9. Avoid unnecessary layers, interfaces, dependencies, global state, configuration options, and premature generalization.
10. Keep documentation and project status aligned with actual implementation.

## 3. SDK and platforms

- Use FVM and commit a .fvmrc SDK pin.
- Initial pin: Flutter 3.47.9; Dart is bundled with Flutter.
- Upgrade when security, compatibility, or a deliberate migration requires it; the pin is controlled, not permanent.
- Android minimum API 24; iOS minimum deployment target 15.0.
- Android and iOS only.
- Impeller: iOS uses Impeller; Android follows Flutter platform defaults (API 29+ default, older-device fallback). Do not force renderer flags without measured justification.
- Android can be validated on a suitable Windows toolchain. Never claim iOS build verification without macOS and Xcode.

## 4. Dependency baseline and policy

Candidate starting versions to verify together in Phase 0:

| Package | Candidate version | Purpose |
|---|---:|---|
| flutter_riverpod | 3.4.3 | State management |
| go_router | 18.1.2 | Navigation |
| forui | 0.27.7 | UI components and theme |
| dio | 5.11.1 | HTTP client |
| shared_preferences | 2.5.6 | Small non-sensitive preferences |
| intl | 0.20.3 | Localization and formatting |
| very_good_analysis | 11.0.0 | Static analysis |
| mocktail | 1.0.5 | Tests without code generation |

This is a starting snapshot, not a permanent pin. Verify publisher, stable release, changelog, SDK constraints, transitive dependencies, license, maintenance, and platform compatibility. Resolve the set and commit pubspec.lock.

Optional dependencies require a real consumer: secure storage, SVG, cached images, or Lottie. No animation, hooks, database, backend, authentication, analytics, or cloud package by default.

Forui is the primary component system. Use its bundled Lucide icons; do not install a separate Lucide package. Integrate Forui through documented APIs and preserve deliberate Material/Cupertino platform integration. No Forui CLI or code generation.

## 5. Architecture and dependency direction

Use pragmatic feature-first architecture. Apply Clean Architecture boundaries selectively when they solve a real separation-of-concerns problem.

- app/: composition root, bootstrap, app configuration, navigation, localization, theme selection, brand/environment configuration, feature activation.
- core/: reusable technical infrastructure (errors, networking, storage, logging, lifecycle, platform adapters, utilities). No product features, branding, route definitions, or business UI.
- design_system/: tokens, themes, typography, shared components, motion primitives. No product features, backend/auth logic, or routes.
- features/: product capabilities, organized by feature; add data/domain/presentation layers only when justified.
- Routes live in app/navigation/, not core/router/.
- Domain policy is independent of Flutter widgets and external infrastructure. Presentation depends on domain contracts; data implements them. App composes. Avoid circular dependencies.
- Models are immutable by default. Use handwritten serialization and copyWith when needed. Add value equality only when semantic equality matters; separate DTOs/entities only when responsibilities differ.
- Do not create empty feature folders or speculative modules.

## 6. Riverpod state management

Use Riverpod 3 manually: providers, NotifierProvider, AsyncNotifierProvider, and families only when justified. No generators. Do not introduce StateProvider or StateNotifierProvider for new state. Use ref.watch for reactive dependencies, ref.read for event handling, and ref.listen for side effects. Use select when it materially limits rebuilds. Prefer feature-scoped auto-disposal; keep app-scoped state alive intentionally. Avoid duplicated state, dispose resources, cancel subscriptions, and check lifecycle after asynchronous gaps. Use local setState for simple ephemeral UI state where clearer.

## 7. Design system and branding

Maintain one source of truth for design tokens, themes, typography, shared component styles, and interaction patterns. Feature screens must not invent independent visual systems or hardcode repeated design values.

Visual direction: premium, restrained, neutral, calm, clear hierarchy, readable typography, purposeful spacing, rounded geometry, restrained shadows. Avoid gratuitous gradients, glass effects, neon, glows, heavy shadows, excessive borders, and card bloat. Functional status colors are allowed when they improve clarity/accessibility.

Spacing: 4, 8, 12, 16, 24, 32, 48, 64. Radii: 8, 12, 16, 24, full. Typography roles: Display, Title, Headline, Body, Body Small, Label, Caption. Typical screen padding 20–24 logical pixels; section spacing usually 24–32 or more when hierarchy requires.

Brand config owns app name, logo/assets, accent color, and optional font/theme overrides. A second app with different branding must not require edits to Core or Design System.

## 8. Forui and themes

Use MaterialApp.router with GoRouter where appropriate and integrate Forui FTheme using documented builder/theme APIs. Select the Forui light or dark theme explicitly from resolved app brightness; do not assume Forui automatically follows Flutter ThemeMode. Forui theme data includes colors, typography, icons, styles, haptics, variants, and component styles/motions. Use touch/mobile behavior. Add root-level overlays/toasts/tooltips only when required. Use Cupertino behavior for native platform interactions where appropriate, not as a competing design system.

Theme preference is System, Light, or Dark. System follows platform appearance; explicit choices override it. Theme behavior must be centralized and consistent.

## 9. Localization and fonts

- English and Arabic only in baseline; correct RTL/LTR.
- Use flutter_localizations, ARB resources, intl, and official gen-l10n.
- The only permitted code generation is official Flutter localization generation. No Freezed, build_runner, json_serializable, or generated Riverpod providers.
- Support System/Arabic/English preference, persistence, dynamic language change without restart, and predictable fallback for unsupported device locales.
- Handle plurals, dates, numbers, currency, accessibility descriptions, direction-sensitive layout/icons.
- Latin digits by default; optional digit preference centralized.
- Bundle licensed IBM Plex Sans Arabic and IBM Plex Sans with fallbacks. No runtime Google Fonts downloads. Brand may override fonts.

## 10. Motion, haptics, and interaction

Prefer Flutter primitives; shared motion lives in design_system/motion/. No mandatory animation package. Motion communicates feedback, state change, continuity, affordance, or restrained delight. It must be purposeful, interruptible, and not block interaction.

Reference durations: fast 120 ms, base 220 ms, slow 320 ms; default maximum 400 ms. Use standard/emphasized curves and gesture-driven springs where appropriate. Respect MediaQuery.disableAnimations and iOS reduced-motion settings. Centralize haptics and avoid duplicate feedback. Preserve native-feeling iOS transitions/back gestures and Android back/predictive-back behavior.

## 11. Navigation and startup

Use GoRouter; centralize route names/paths, validate parameters, preserve correct nested navigation/back stacks, and add deep links only when required. Use StatefulShellRoute only for actual persistent tabs. Navigation belongs in app/navigation/.

Startup: minimal native launch presentation followed immediately by Flutter startup UI. No arbitrary fixed delays. Resolve essential initialization and initial theme/locale before presenting the correct app state. Recoverable errors need recovery paths; no permanent spinner. Bootstrap only required framework/platform setup, essential preferences, environment, initial theme/locale, and root ProviderScope. Initialize optional services only when needed.

## 12. Networking and errors

Use Dio when networking is required. Core must work without authentication. Prefer one configured app-level Dio unless isolation is justified. Centralize base options, timeouts, cancellation, interceptors, response validation, safe logging, and error normalization.

Retry transient failures only: at most two retries after initial attempt, exponential backoff, jitter, capped delay, Retry-After support, cancellation. Retry GET/HEAD; PUT/DELETE only if idempotent; POST only with server-supported idempotency. Authentication is optional; if added, isolate token injection, coordinated refresh, 401 handling, and refresh-loop prevention.

Normalize failures at the data boundary: Network, Timeout, Unauthorized, Forbidden, NotFound, Validation, Conflict, RateLimited, Server, Cancelled, Unknown. Map to localized UI; never expose raw exceptions or sensitive server responses.

## 13. Storage, offline, logging

Use SharedPreferencesAsync through an adapter for small non-sensitive preferences (theme/language). Never store credentials or critical transactional data there. Secure storage is optional and only for real sensitive values. No mandatory database; any DB requires schema/migration/corruption/recovery planning.

Offline UX should provide meaningful errors, retry, and stale-data indicators when cached reads are justified. Connectivity is not proof of internet access. No sync engine by default.

Redact secrets and personal data before logging. Do not log tokens, credentials, sensitive bodies, or unnecessary user data.

## 14. Security and privacy

Use OWASP MASVS as a threat-model-appropriate review checklist. Enforce HTTPS, no secrets in source/assets/config/command-line defines, secure tokens, least privilege, input validation, safe logs, release configuration, dependency review, and signing hygiene.

Minimize personal data and retention. Request permissions contextually. Analytics are off by default. Document retention/deletion when user data is introduced. Certificate pinning is not default; it requires threat model, rotation strategy, and recovery plan. Obfuscation is not a security substitute.

## 15. Lifecycle and platform capabilities

Handle resume/pause/background/foreground, session expiry, stale request cancellation, and selective refresh where relevant. Permissions are minimal/contextual; handle denial and permanent denial. Biometrics, camera, gallery, notifications, location, files, sharing, deep links, background work, and similar capabilities are optional. Add only when a real feature consumes them, and keep dependencies/permissions/native setup removable.

## 16. Accessibility and responsive behavior

Support TalkBack/VoiceOver semantics, labels, focus, contrast, text scaling, non-color feedback, reduced motion, and keyboard interaction. Touch targets should be at least 48 logical pixels where applicable.

Design mobile-first for compact, standard, and large phones; support portrait/landscape where relevant. Respect safe areas and keyboard insets. Adapt to constraints, not device model names. Tablet-specific layouts are not required, but wider screens must not break.

Forms must handle validation, focus, keyboard actions, formatting, disabled/loading/error states, accessibility, RTL, and insets. Dispose controllers.

## 17. Performance and reliability

Prefer const when useful, inexpensive deterministic builds, lazy lists/slivers, and bounded caches. Avoid large-list shrinkWrap, nested scroll traps, expensive scroll effects, and large opacity subtrees. Use RepaintBoundary only when profiling supports it. Size/cache images deliberately; avoid excessive precaching. Use isolates only for justified expensive CPU work. Dispose resources, cancel work, and handle async errors.

Target stable 60 fps on representative baseline devices; 16.67 ms at 60 Hz and 8.33 ms at 120 Hz are frame budgets, not guarantees. Profile on real devices.

## 18. UX states

Handle relevant initial/loading/refreshing/content/empty/error/offline/stale/partial/permission-denied/validation/processing/success states where a feature needs them. Do not force every state onto every screen. Make transitions understandable and recoverable.

## 19. Testing and quality assurance

- Unit tests: business rules, repositories, failures, formatters, providers, storage, data mapping, lifecycle.
- Widget tests: shared components, screens, forms, states, navigation, theme, locale, semantics.
- Goldens: key components in light/dark, English/Arabic/RTL with controlled fonts/environment.
- Integration: startup, navigation, persistence, theme/language, forms, errors, critical platform flows.
- Debug-only Component Gallery: tokens, components, variants, states, light/dark, English/Arabic/RTL, accessibility; never production.
- Use very_good_analysis with strict casts/inference/raw types and minimal justified overrides.
- Consistent naming/imports, const/final discipline, no print, intentional unawaited work, disposal, cancellation, async error handling, mounted checks, no hidden global state.
- Around 300 lines/file and 80 lines/build method are review triggers, not absolute limits.
- CI gates: pinned SDK, dependency resolution, format, analysis, tests, Android build, iOS build on macOS.

## 20. Environments, release, Git

Prepare Dev/Staging/Production flavors only when needed; remove unused flavors via init_app. Environment config is independent of branding. No private secrets in Dart, JSON, assets, or --dart-define.

Android release review: AAB, signing, IDs, permissions, target SDK, obfuscation/symbols, store requirements. iOS: archive, signing/provisioning, bundle IDs, permissions, store requirements. Never claim store readiness without actual builds/checks.

Commit source/config/lockfiles/docs; never secrets, build outputs, local SDK caches, or backups. Use focused meaningful commits. ADRs record consequential architecture/platform/state/navigation/dependency/security/storage/design choices, not trivial details. GitHub Actions is the CI platform.

## 21. Optional modules

Auth, onboarding, push, analytics, crash reporting, payments, database, advanced offline sync, biometrics, and background processing are optional. Each must be independently removable, including routes/providers/dependencies/init/permissions/native config/assets/docs. No dead wiring.

## 22. Documentation and app initialization

Maintain README, architecture, design system, development, dependencies, ADRs, recipes, quality checklist, and project status. Avoid duplicated/contradictory docs.

The future init_app workflow creates an independent app from reviewed templates. It configures name, organization, IDs, brand/assets, environments/flavors, selected modules; validates naming/identifiers/consistency; avoids unsafe overwrites; reports changes; and is reproducible. It must not invent app-specific business logic.

A second app with different brand/configuration is required validation. Core and Design System must remain unchanged.

## 23. Delivery phases

0. Foundation: SDK pin, dependency audit, lints, structure, config.
1. Design system: tokens, Forui, light/dark, brand config.
2. Localization: Arabic/English, RTL, fonts, system locale.
3. Components, motion, haptics, reduced motion.
4. Gallery and accessibility.
5. Bootstrap, splash, GoRouter, deep links, shell only if needed, platform transitions.
6. Core errors, network, logging, storage, lifecycle; secure adapter only if needed.
7. Settings/onboarding if required.
8. Optional auth module.
9. Template/init_app, flavors, docs, recipes.
10. Real reference feature.
11. Second-app reuse validation with no Core/Design System changes.

## 24. Final acceptance

Completion requires evidence for: pinned SDK; audited dependencies; clean analysis/formatting; meaningful tests; Android and iOS builds on suitable environments; Forui integration; theme/language/RTL behavior; reduced motion; native-feeling navigation/back; splash/bootstrap and recoverable startup; network independent of auth; normalized errors; appropriate storage; security/privacy docs; accessible gallery; performance baselines; CI; reproducible init_app; and a second independently branded app with no Core/Design System changes.

**Locked rule:** This constitution defines requirements and quality gates. It must never be confused with proof that implementation, tests, builds, or release acceptance have passed.
