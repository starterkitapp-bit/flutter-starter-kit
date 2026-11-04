# Design System

## Purpose

Provide one consistent, reusable visual and interaction language across every app created from this starter. This document is a design baseline; tokens and components are not yet implemented.

## Visual direction

Premium, restrained, neutral, calm. Use clear hierarchy, readable typography, purposeful spacing, rounded geometry, and restrained shadows. Avoid gratuitous gradients, glass effects, neon, glows, heavy shadows, excessive borders, and card bloat. Functional status colors are permitted when they improve meaning and accessibility.

## Token foundations

- Spacing: 4, 8, 12, 16, 24, 32, 48, 64 logical pixels.
- Radii: 8, 12, 16, 24, full.
- Typography: Display, Title, Headline, Body, Body Small, Label, Caption.
- Typical screen horizontal padding: 20–24 logical pixels.
- Typical section spacing: 24–32 logical pixels or more when hierarchy requires.

Promote these into typed tokens during implementation. Do not scatter repeated literal values through feature screens.

## Theme and components

Support complete Light and Dark themes plus System preference. System follows platform brightness; explicit choices override it. Theme selection must be centralized across Flutter and Forui.

Forui is the primary component system. Use documented theme/widget APIs and explicitly select the matching Forui brightness. Use Cupertino behavior for native platform interactions where appropriate, not as a competing design system.

## Branding and typography

Brand configuration owns app identity, logo/assets, accent color, and optional font/theme overrides. Brand changes must not require Core or Design System source edits.

Bundle appropriately licensed IBM Plex Sans and IBM Plex Sans Arabic fonts with fallbacks. Verify and include font licenses before committing binaries. Do not depend on runtime font downloads.

## Motion and accessibility

Use Flutter primitives and shared motion tokens. Reference durations: 120 ms fast, 220 ms base, 320 ms slow, default maximum 400 ms. Motion communicates state change, feedback, continuity, or affordance; it must be interruptible and respect reduced motion.

Centralize purposeful haptics. Validate contrast, semantics, screen-reader labels, 48 logical pixel touch targets where applicable, text scaling, focus, keyboard interaction, and non-color status communication. The debug gallery must not ship in production.
