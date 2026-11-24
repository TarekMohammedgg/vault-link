---
name: vault-link
description: Connect a code project's agent instruction files to the user's local or Git-hosted knowledge vault, Obsidian vault, or second brain. Use when linking, changing, or refreshing the memory source available to project agents.
metadata:
  updated: "2026-11-24"
---

# Vault Link

Use the source the user specifies. A vault can be any folder. It does not need a marker file or a project registry.

1. Find the target project's root. Preserve its existing agent instructions.
2. For a local folder, run `vault-link --local "<vault folder>"`. For a repository, run `vault-link --repo "<Git HTTPS or SSH URL>"`. Run in the project root or append the project directory.
3. Use `--check` to preview changes when the user requests a preview. Run `vault-link --update` to reuse an already linked source and refresh an existing cache.
4. Verify that `AGENTS.md` has exactly one managed vault link and that `.vault-link-local` is ignored. Keep custom content in `CLAUDE.md` and `GEMINI.md` and check that they import `AGENTS.md`.
5. Open the vault's own entrypoint when needed. Follow its access and writing rules. Linking grants agents a way to find the vault, so keep vault notes and credentials in their original locations.

See [README.md](README.md) for installation and [INIT-PROMPT.md](INIT-PROMPT.md) when the CLI is unavailable.
