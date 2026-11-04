# Security and Privacy Baseline

Security controls are selected according to the data, threat model, and platform capability involved. Use OWASP MASVS as a review reference; do not claim certification or compliance without a formal assessment.

## Secrets and configuration

- Never commit private API keys, credentials, signing secrets, tokens, or production secrets.
- Dart defines, JSON, assets, and bundled configuration are not secret storage.
- Separate environment configuration from branding.
- Keep signing keys and provisioning credentials in protected CI secrets or secure operator-managed storage.

## Data protection

- Minimize personal data collection, processing, and retention.
- Use platform-appropriate secure storage for sensitive tokens or credentials when a real feature requires them.
- SharedPreferences is only for small non-sensitive preferences; never store credentials or critical transactional data there.
- Define retention and deletion behavior when user data is introduced.
- Validate external input and treat server responses as untrusted.

## Network security

- Use HTTPS for production endpoints.
- Centralize network configuration, timeouts, cancellation, response validation, and error normalization.
- Never expose raw server bodies, tokens, or transport exceptions to users or logs.
- Certificate pinning is not a default. It requires a threat model, key rotation plan, and recovery/fallback strategy.

## Logging and diagnostics

- Use `core/logging/AppLogger` as the shared diagnostic boundary.
- Redact sensitive context keys, bearer credentials, common secret key/value pairs, query credentials, and email addresses before invoking any writer.
- The logger records an error's runtime type only; it never records the raw exception message.
- Do not pass request/response bodies, authorization headers, passwords, tokens, or unnecessary identifiers as context.
- Custom writers receive sanitized entries only. Keep production diagnostics useful without exposing private data.
- Logging is opt-in at the call site; do not install a global interceptor or log every network request by default.

## Permissions and platform security

- Request the minimum permission at the point it is needed, with clear user context.
- Handle denial and permanent denial without breaking unrelated functionality.
- Review Android/iOS manifests, entitlements, URL schemes, exported components, and transport policies when platform capabilities are added.
- Obfuscation is not a substitute for secure design.

## Review checklist

- [ ] Data inventory and trust boundaries identified.
- [ ] Threats and abuse cases considered for the feature.
- [ ] No secrets embedded in source or artifacts.
- [ ] Storage choice matches data sensitivity.
- [ ] Logs and errors are redacted.
- [ ] Permissions are minimal and contextual.
- [ ] Input/output validation and authorization boundaries are correct.
- [ ] Dependency and release configuration reviewed.
- [ ] Privacy, retention, and deletion requirements documented where applicable.
