# ADR 0002: Handwritten Dart; No Code Generation

- Status: Accepted
- Date: 2026-11-04

## Context

The starter should remain understandable and maintainable without unnecessary generated layers or tooling.

## Decision

Do not add Freezed, build_runner, json_serializable, generated Riverpod providers, or custom code-generation tooling. Write models, serialization, and providers manually. The sole exception is Flutter's official gen-l10n localization generation from ARB files.

## Consequences

Handwritten models must remain concise and tested. Do not introduce custom generators as a workaround. Localization generation must use the official Flutter workflow and remain reproducible from committed ARB inputs.
