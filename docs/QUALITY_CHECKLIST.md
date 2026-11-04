# Quality Checklist

Use before implementation, during review, and before marking a phase complete.

## Scope and design
- [ ] Goal and acceptance criteria are explicit.
- [ ] Existing architecture and ADRs were checked.
- [ ] Smallest adequate solution selected.
- [ ] No unrelated edits, speculative abstractions, or duplicate sources of truth.
- [ ] Failure, edge, lifecycle, concurrency, and future-change cases considered.

## Architecture and maintainability
- [ ] Dependency direction respected; no circular dependencies.
- [ ] Core contains technical infrastructure only.
- [ ] Design System contains reusable visual/interaction foundations only.
- [ ] Feature boundaries are clear; layers are justified.
- [ ] Resources, subscriptions, controllers, and requests are disposed/cancelled.
- [ ] No dead code, fake functionality, or empty placeholder directories.

## UI, localization, accessibility
- [ ] Light, Dark, and System behavior consistent.
- [ ] English LTR and Arabic RTL correct.
- [ ] Direction-aware layout and icons used.
- [ ] Relevant loading, empty, error, success, and other states handled.
- [ ] Touch targets, contrast, semantics, focus, and text scaling reviewed.
- [ ] Reduced motion respected; motion does not block interaction.

## Security and privacy
- [ ] No secrets, keys, tokens, or production credentials committed.
- [ ] Logs redact sensitive values.
- [ ] Permissions minimal and contextual.
- [ ] Inputs and external responses validated.
- [ ] Sensitive storage uses an appropriate secure mechanism.
- [ ] Privacy/data-retention implications documented.

## Performance and reliability
- [ ] Lists and images sized/lazy-loaded appropriately.
- [ ] No unnecessary rebuilds, expensive effects, or unbounded caches.
- [ ] Async failures and cancellation handled.
- [ ] Lifecycle/offline behavior considered where relevant.
- [ ] Performance claims backed by profiling or measurements.

## Verification
- [ ] Formatting check passed.
- [ ] dart analyze passed and output inspected.
- [ ] Relevant unit/widget/integration tests passed.
- [ ] Android build passed on a suitable toolchain.
- [ ] iOS build passed on macOS/Xcode when required.
- [ ] CI results inspected.
- [ ] Documentation and Project Status match verified state.

A checked box requires evidence. A planned or documented control is not a passed check.
