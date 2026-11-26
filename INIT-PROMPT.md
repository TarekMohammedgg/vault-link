---
title: "Vault Link manual setup"
type: guide
updated: 2026-11-26
description: "Open when an agent must connect a project to Tarek's Second Brain without the vault-link CLI."
tags: []
---

# Link a project to the Second Brain manually

1. Work from the target project's root. Read its existing `AGENTS.md` first and preserve all project-specific instructions.
2. Ask Tarek for the exact local vault directory or Git URL if it has not been supplied. Never guess the path.
3. Add `/.vault-link-local` to the project's `.gitignore`.
4. Create `.vault-link-local` with:
   - `source: local`
   - `vault_path: <absolute local path>`

   For a Git source, use `source: repo`, set `vault_path` to the local cache path, and add `vault_repo: <credential-free Git URL>`.
5. Before the first read/search in TarekVault and immediately before each vault write, run `git pull --rebase --autostash` in the vault and check `git status -sb`. If sync fails or the branch is behind, do not write. For other vaults, follow their own sync rules.
6. Add or replace one complete managed section in the project's `AGENTS.md`, delimited by `<!-- vault-link:start -->` and `<!-- vault-link:end -->`. Preserve everything outside the markers. Use the behavior in [SKILL.md](SKILL.md):
   - Project `AGENTS.md` governs project work.
   - Vault `AGENTS.md`, router, and Agent Write Method govern vault operations.
   - Keep project documentation current.
   - Ask before saving durable preferences, cross-project workflows, or reusable skills.
   - Never log sessions or routine activity.
7. Add `@AGENTS.md` to `CLAUDE.md` and `GEMINI.md` if the import is missing. Preserve their existing instructions.
8. Verify that the pointer is ignored and exactly one managed block exists.

Do not copy vault notes or credentials into the project. Do not write to the vault until its own rules have been read and any required approval has been obtained.
