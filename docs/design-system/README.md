# Design System and Style Guide

## Purpose

Provide one consistent visual and interaction language across every app created from this starter. Shared decisions have one source of truth, while implementation remains separated by responsibility.

## Foundations and central ownership

| Concern | Source of truth |
|---|---|
| Colors and semantic roles | Forui theme colors, extended only for justified app semantics |
| Typography | Central typography system; Forui typography integration |
| Spacing | `lib/design_system/tokens/app_spacing.dart` |
| Radii | `lib/design_system/tokens/app_radius.dart` |
| Motion | `lib/design_system/tokens/app_motion.dart` |
| Elevation/shadows | Central elevation tokens when a real component needs them |
| Themes | `lib/design_system/theme/` and root theme selection |
| Shared components | `lib/design_system/components/` |
| Motion behavior | `lib/design_system/motion/` |
| Haptics/feedback | `lib/design_system/feedback/` |

Do not duplicate Forui's existing color or typography system without a concrete gap. Centralization does not mean placing every token and component in one file.

## Visual direction

Premium, restrained, neutral, calm. Use clear hierarchy, readable typography, purposeful spacing, rounded geometry, and restrained shadows. Avoid gratuitous gradients, glass effects, neon, glows, heavy shadows, excessive borders, and card bloat. Functional status colors are allowed when they improve meaning and accessibility.

## Implemented foundations

- Spacing: 4, 8, 12, 16, 24, 32, 48, 64 logical pixels.
- Radii: 8, 12, 16, 24, and full radius.
- Motion reference durations: 120 ms fast, 220 ms base, 320 ms slow, 400 ms maximum.
- Brightness-aware Forui neutral mobile touch theme selection.
- Shared `AppSection` layout component.
- Reduced-motion-aware `AppMotionScope`.
- Centralized selection haptics with safe handling of unsupported platform channels.
- Shared `AppAnimatedSwitcher` fade transition.

## Theme and component rules

Support complete Light and Dark themes plus System preference. Resolve app brightness at the root and select the matching Forui theme centrally. Forui is the primary component system; feature screens must use shared components where a suitable component exists rather than inventing inconsistent buttons, fields, or loading indicators.

Component APIs must have clear names, predictable states, appropriate semantics, and no contradictory configuration options. Add a shared component when it has repeated use or a meaningful consistency/accessibility benefit—not simply to wrap one widget without value.

## Patterns and interaction states

Use consistent screen structure, section hierarchy, spacing, form behavior, and feedback patterns. Handle loading, empty, error, success, disabled, validation, offline, and processing states when relevant to the feature. Avoid adding every possible state to every screen.

## Localization and direction

English and Arabic resources live in `lib/app/localization/arb/`; generated localization APIs are produced by Flutter's official `gen-l10n`. English is the defined unsupported-locale fallback. Arabic uses RTL and English uses LTR. Prefer directional padding/alignment/icons and allow for text expansion.

## Typography and branding

Brand configuration owns app identity, logos/assets, accent, and optional font/theme overrides. IBM Plex Sans and IBM Plex Sans Arabic are the planned bundled font families; add font binaries only after verifying licenses and fallback behavior. Do not depend on runtime font downloads.

## Motion, haptics, and accessibility

Motion must communicate state change, feedback, continuity, or affordance; it must be interruptible and never block interaction. Respect Android disable-animations and iOS Reduce Motion settings. Centralize purposeful haptics and avoid duplicate feedback.

Review contrast, semantics, screen-reader labels, 48 logical-pixel touch targets where applicable, text scaling, focus, keyboard interaction, and non-color status communication. The future component gallery is debug-only and must not ship in production.

## Design review checklist

- [ ] Uses centralized tokens, themes, and shared components where appropriate.
- [ ] Light and Dark themes remain complete and legible.
- [ ] English/LTR and Arabic/RTL layouts remain correct.
- [ ] Text scaling, contrast, semantics, focus, and touch targets reviewed.
- [ ] Loading/empty/error/success states are coherent where applicable.
- [ ] Motion is purposeful and reduced-motion aware.
- [ ] No duplicate styles, arbitrary hardcoded design values, or unnecessary visual decoration.
