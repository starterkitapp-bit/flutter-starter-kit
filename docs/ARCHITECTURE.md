# Architecture

## Status

Architecture baseline adopted; implementation pending. See Project Status.

## Boundaries

- app/: composition root, bootstrap, configuration, navigation, localization, theme selection, brand/environment configuration, feature activation.
- core/: reusable technical infrastructure such as errors, networking, storage, logging, lifecycle, platform adapters, utilities. No product features, routes, branding, or business UI.
- design_system/: tokens, theme integration, typography, shared components, motion primitives. No product features, backend/auth logic, or routes.
- features/: product capabilities, organized by feature. Add data/domain/presentation layers only when they establish meaningful boundaries.

Create directories only when they contain real files. Do not create empty feature placeholders.

## Dependency direction

Domain policy is independent of Flutter widgets and external infrastructure. Presentation depends on domain contracts; Data implements those contracts. Core provides technical capabilities. App composes. Design System is reusable presentation infrastructure. Avoid circular dependencies.

## State and navigation

Use Riverpod 3 manually. Choose provider types and lifetimes deliberately; avoid duplicated state. Local ephemeral UI state may use setState when simpler.

GoRouter definitions live in app/navigation/, never Core. Centralize route names/paths, validate parameters, and preserve nested navigation/back behavior. Add deep links and persistent shell navigation only when required.

## Models

Prefer immutable models. Handwrite serialization and copyWith when needed. Separate transport models from domain entities only when responsibilities differ. Add value equality when it matters to behavior.

## Multi-app reuse

Brand and environment configuration are separate. A second app may change identity, assets, accent, optional fonts, environment, and selected modules without editing Core or Design System. Validate this with a second app before declaring the starter reusable.
