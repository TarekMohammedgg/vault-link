---
title: "Vault link manual fallback"
type: guide
updated: 2026-11-24
description: "Open when an agent must link a local vault and cannot use the vault-link command."
tags: []
---

# Link a vault manually

Use the project's root and the exact local vault directory the user provides. For a remote vault, use an existing authorized checkout or ask the user for access to one.

1. Add `/.vault-link-local` to the project's ignore file. Create `.vault-link-local` with `source: local` and `vault_path: <absolute local path>` on separate lines.
2. Append a managed section to `AGENTS.md` or replace the existing complete section delimited by `<!-- vault-link:start -->` and `<!-- vault-link:end -->`. Treat an existing complete `vault-bridge` section as the same link. Preserve everything outside the markers.
3. In the managed section, tell agents to read `vault_path:` from the ignored pointer. Have them start with the vault's `AGENTS.md` or top-level `README.md` and follow its rules.
4. Add `@AGENTS.md` to `CLAUDE.md` and `GEMINI.md` if the import is missing. Preserve their existing instructions.

Verify that the project contains one link and that the pointer is ignored. Vault notes and credentials stay outside the generated instructions.
