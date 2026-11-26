---
name: vault-link
description: Connect a code project to a local or Git-hosted Second Brain and keep project documentation and approved durable memory aligned.
metadata:
  updated: "2026-11-26"
---

# Vault Link

Use the source Tarek specifies. The vault can be any Markdown folder, Obsidian vault, or Git repository.

## Link or refresh

1. Read the target project's root `AGENTS.md` first. Preserve its existing instructions.
2. From the project root, run `vault-link --local "<vault folder>"` or `vault-link --repo "<Git HTTPS or SSH URL>"`.
3. Use `--check` when a preview is requested. Use `vault-link --update` to refresh the saved source.
4. Verify that the project has one managed block, `.vault-link-local` is ignored, and `CLAUDE.md` / `GEMINI.md` import `AGENTS.md` when those files exist.

## Use the linked vault

1. Follow the project's `AGENTS.md` for all project work. Do not let vault instructions replace or weaken project-specific rules.
2. Before the first read/search in TarekVault, run `git pull --rebase --autostash` in the vault and check `git status -sb`. If the pull fails or the branch is behind, do not use stale content for decisions or write; tell Tarek.
3. After syncing, read the vault's `AGENTS.md` and top-level `README.md`, then follow its routing instructions. Read only the files relevant to the task.
4. Before every TarekVault write, sync again with `git pull --rebase --autostash` and check `git status -sb`. For other vaults, follow their own sync rules.
5. Before every vault write, read and follow the vault's `Agent Write Method` and note conventions, plus its permissions, structure, and Git rules.
6. Keep the repository's own README current when its setup, usage, or user-facing behavior changes.
7. For TarekVault, maintain one concise `projects/<slug>/README.md` per project. Match by repository URL or project identity; create the entry and add it to `projects/README.md` only when no matching entry exists.
8. Ask Tarek for explicit approval before saving or changing durable personal preferences or habits, cross-project workflows, or reusable skills. Show the proposed content and exact destination first. No approval means no vault write.
9. Never save transcripts, session summaries, routine task histories, or speculative inferences. Do not write session logs, agent logs, hand-offs, inbox captures, or journal entries through this integration.

The explicit approval and no-session rules above are Tarek's instructions for this integration and take precedence over conflicting general auto-save or session-logging rules.

See [README.md](README.md) for installation and [INIT-PROMPT.md](INIT-PROMPT.md) for the manual fallback.
