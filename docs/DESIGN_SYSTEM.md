# Design System

## Purpose

Provide one consistent, reusable visual and interaction language across every app created from this starter. Tokens and theme selection are centralized in `lib/design_system/`.

## Visual direction

Premium, restrained, neutral, calm. Use clear hierarchy, readable typography, purposeful spacing, rounded geometry, and restrained shadows. Avoid gratuitous gradients, glass effects, neon, glows, heavy shadows, excessive borders, and card bloat. Functional status colors are permitted when they improve meaning and accessibility.

## Implemented foundations

Typed tokens are available from:

- `tokens/app_spacing.dart`: 4, 8, 12, 16, 24, 32, 48, 64 logical pixels.
- `tokens/app_radius.dart`: 8, 12, 16, 24, and full radius.
- `tokens/app_motion.dart`: 120 ms fast, 220 ms base, 320 ms slow, 400 ms maximum reference durations.
- `theme/app_theme.dart`: one brightness-aware source for the Forui neutral mobile touch themes.

Use these tokens instead of scattering repeated literal values through feature screens. Typical screen horizontal padding is 20–24 logical pixels; typical section spacing is 24–32 logical pixels or more when hierarchy requires.

## Theme and components

Support complete Light and Dark themes plus System preference. System follows platform brightness; explicit choices override it. The root app resolves brightness once and passes the matching Forui theme through the centralized `AppTheme` selector.

Forui is the primary component system. Use documented theme/widget APIs and explicitly select the matching Forui brightness. Use Cupertino behavior for native platform interactions where appropriate, not as a competing design system.

## Localization and direction

English and Arabic message resources live in `lib/app/localization/arb/`; Flutter's official `gen-l10n` generates the typed localization API into `lib/app/localization/generated/`. English is the deliberate fallback for unsupported device locales; Arabic uses RTL and English uses LTR. User-selectable, persisted language preference is a separate settings/bootstrap responsibility and remains pending.

## Branding and typography

Brand configuration owns app identity, logo/assets, accent color, and optional font/theme overrides. Brand changes must not require Core or Design System source edits.

Bundle appropriately licensed IBM Plex Sans and IBM Plex Sans Arabic fonts with fallbacks. Verify and include font licenses before committing binaries. Do not depend on runtime font downloads.

## Motion and accessibility

Use Flutter primitives and shared motion tokens. Motion communicates state change, feedback, continuity, or affordance; it must be interruptible and respect reduced motion.

Centralize purposeful haptics. Validate contrast, semantics, screen-reader labels, 48 logical pixel touch targets where applicable, text scaling, focus, keyboard interaction, and non-color status communication. The debug gallery must not ship in production.
