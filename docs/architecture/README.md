# Architecture

## Status and governing rules

The architecture follows pragmatic Feature-First organization, SOLID, and separation of concerns. Apply principles to solve concrete maintenance or change-isolation problems; do not create interfaces, layers, managers, or abstractions by ritual.

A change to foundational dependency rules requires review and an accepted ADR.

## Module responsibilities

- `app/`: composition root, bootstrap, app configuration, navigation, localization, theme selection, branding/environment configuration, and feature activation.
- `core/`: reusable technical infrastructure such as errors, networking, storage, logging, lifecycle, platform adapters, and utilities. It must not contain product features, brand rules, route definitions, or business UI.
- `design_system/`: design tokens, theme integration, typography, shared components, and motion primitives. It must not own product features, backend/auth logic, or routes.
- `features/`: product capabilities organized by feature. Add data/domain/presentation layers only when each layer has a meaningful responsibility.
- `docs/decisions/`: consequential technical decisions and their rationale.

Create directories only when they contain real files. Do not create empty feature placeholders.

## Dependency direction

- Domain policy is independent of Flutter widgets and external infrastructure.
- Presentation depends on domain contracts where a domain boundary is justified.
- Data implements the contracts required by the feature.
- Core provides technical capabilities; it does not depend on feature implementations.
- App composes the application and wires dependencies.
- Design System is reusable presentation infrastructure.
- Features must not depend on another feature's implementation details. Shared behavior belongs in a properly owned shared module only when more than one consumer justifies it.
- Circular dependencies and hidden cross-layer dependencies are prohibited.

## SOLID in practice

- Single Responsibility: keep a class/module focused on one reason to change; avoid God Classes.
- Open/Closed: extend through stable seams when real variation exists; do not predict hypothetical variants.
- Liskov Substitution: implementations must preserve the behavioral contract, not merely match a type.
- Interface Segregation: expose small contracts required by consumers; do not create interfaces for every class.
- Dependency Inversion: isolate volatile infrastructure behind a contract when it materially improves testing or change isolation.

## State and navigation

Use Riverpod 3 manually. Select provider types and lifetimes deliberately; avoid providers that duplicate existing state. Local ephemeral UI state may use `setState` when simpler. Keep navigation definitions in `app/navigation/`, never Core. Centralize paths/names, validate external parameters, and preserve correct back-stack behavior. Deep links and persistent shell navigation require explicit use cases and tests.

## Models and data boundaries

Prefer immutable models. Handwrite serialization and `copyWith` when needed. Separate transport DTOs from domain entities only when their responsibilities or lifecycles differ. Add value equality when it matters to behavior. Validate external input at the boundary and map transport failures into the central failure model.

## Reuse validation

Brand and environment configuration are separate. A second app must be able to change identity, assets, accent, optional fonts, environment, and selected modules without editing Core or Design System. This is a final acceptance requirement, not an assumed property.

## Networking boundary

`core/network/` owns reusable transport setup and transport-to-failure mapping. The shared Dio factory applies bounded connection, send, and receive timeouts; consuming apps supply their environment-specific base URL. Authentication and diagnostic interceptors are opt-in and must be added by the app composition root.

Map `DioException` to the transport-independent `Failure` model at the data boundary. Do not pass raw Dio exceptions, server response bodies, or transport-specific types into domain or presentation code. The initial mapper handles common HTTP statuses and numeric `Retry-After` values; malformed or unsupported cases remain safely classified as unknown. Automatic retries are intentionally absent until request idempotency and endpoint policy are explicitly defined.
