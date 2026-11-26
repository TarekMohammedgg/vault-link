---
title: "Vault Link manual setup"
type: guide
updated: 2026-11-26
description: "Open when an agent must connect a project to Tarek's Second Brain without the vault-link CLI."
tags: []
---

# Link a project to the Second Brain manually

1. Work from the target project's root. Read its existing `AGENTS.md` first and preserve it as the authority for project work.
2. Ask Tarek for the exact local vault directory or Git URL if it has not been supplied. Never guess the path.
3. Add `/.vault-link-local` to the project's `.gitignore`.
4. Create `.vault-link-local` with `source: local` and `vault_path: <absolute path>`. For a Git source, use `source: repo`, set the local cache path, and add a credential-free `vault_repo: <Git URL>`.
5. Before the first TarekVault read/search and immediately before every vault write, run `git pull --rebase --autostash` and check `git status -sb`. If sync fails or the branch is behind, do not write or rely on stale content for decisions; tell Tarek.
6. Add or replace one managed section in project `AGENTS.md`, delimited by `<!-- vault-link:start -->` and `<!-- vault-link:end -->`. Preserve all text outside the markers. The managed instructions must establish:
   - Project `AGENTS.md` governs project work.
   - Vault `AGENTS.md`, router, Agent Write Method, and Obsidian conventions govern vault operations.
   - The Vault project README is the canonical cross-model Agent Project Brief.
   - Update that brief when verified project context changes; replace stale facts instead of appending history.
   - Reuse relevant workflows from `agents/workflows/` by Obsidian wikilink; create a separate workflow note only for a genuinely reusable new process, then link it from the project brief.
   - Ask before saving durable personal preferences, habits, or reusable skills.
   - Never create session logs, summaries, transcripts, hand-offs, inbox captures, or journal entries.
7. Add `@AGENTS.md` to `CLAUDE.md` and `GEMINI.md` if the import is missing. Preserve existing instructions.
8. Verify the pointer is ignored and exactly one managed block exists.

Do not copy vault notes or credentials into the project. Follow the vault's Agent Write Method for every vault note.

## Vault → Project: create first, then link

Use this only after Tarek explicitly asks to create a new project from inside TarekVault.

1. Ask for the exact project name/slug, target directory, and source folders/repositories if missing. Never scan or auto-discover other folders.
2. Use the coding agent's local filesystem access to inspect the supplied sources and create the project scaffold in the requested target directory. Vault Link itself does not generate project code.
3. Reuse the matching project brief if it exists. Otherwise create `projects/<slug>/README.md` from the vault's project README template and add its row to `projects/README.md`.
4. After the target directory exists, run the explicit programmatic trigger:

   ```powershell
   vault-link --link-created --local "<absolute vault path>" "<absolute project path>"
   ```

   Use `--repo "<credential-free Git URL>"` instead of `--local` for a Git-hosted vault.
5. Verify the pointer, managed block, and agent imports. This mode only links/configures an existing project; it does not create the scaffold. Re-running it must not duplicate setup.

No background monitoring, automatic discovery, or auto-linking of unrelated projects is allowed.
