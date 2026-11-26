---
name: vault-link
description: Connect a code project to a local or Git-hosted Second Brain and keep its canonical agent brief and reusable workflows aligned.
metadata:
  updated: "2026-11-26"
---

# Vault Link

Use the source Tarek specifies. The vault can be any Markdown folder, Obsidian vault, or Git repository.

## Link or refresh

1. Read the target project's root `AGENTS.md` first. Preserve it; it is authoritative for project work.
2. From the project root, run `vault-link --local "<vault folder>"` or `vault-link --repo "<Git HTTPS or SSH URL>"`.
3. Use `--check` for a preview and `vault-link --update` to refresh the saved source.
4. Verify one managed block, an ignored `.vault-link-local`, and `CLAUDE.md` / `GEMINI.md` imports when present.

## Use the linked vault

1. Follow the project's `AGENTS.md` for coding, architecture, commands, tests, and repository changes. Vault instructions never override it.
2. Before the first TarekVault read/search, run `git pull --rebase --autostash` and check `git status -sb`. If sync fails or the branch is behind, do not use stale content for decisions or writes; tell Tarek.
3. Read vault `AGENTS.md` and root `README.md`, then follow their routing. Read only relevant files.
4. Before every vault write, sync again and check `git status -sb`.
5. Before every vault write, follow [[agents/skills/agent-write-method/SKILL|Agent Write Method]] and the Obsidian note conventions. Keep files small, use frontmatter, and link related notes with wikilinks.
6. The project's `projects/<slug>/README.md` is the **canonical Agent Project Brief** and the final shared context for that project across Claude, ChatGPT, Gemini, Codex, and other agents. It is not a copy of the repository's public README and does not have to follow that README's audience or structure.
7. Update the project brief directly when verified project facts change: purpose, architecture, requirements, constraints, decisions, current state, known issues, next step, or relevant workflow links. Replace stale facts; do not append session summaries or maintain a running activity history.
8. Keep the repository's own README current for its users when setup, installation, usage, or public behavior changes. The repository's code/configuration is evidence of implementation; if it conflicts with the Vault brief, inspect the project and reconcile the brief rather than blindly trusting either document.
9. For each project, keep one concise `projects/<slug>/README.md`. Match by repository URL or project identity; create it and add it to `projects/README.md` only when absent.
10. Check `agents/workflows/README.md` for a relevant reusable workflow. If one exists, link it from the project brief using an Obsidian wikilink; do not copy its steps into the project README. If a genuinely reusable workflow is new, create a separate note under `agents/workflows/`, add it to that folder's README, and link it from the project brief. Do not turn one-off task steps into permanent workflows.
11. Durable personal preferences and habits, and reusable skills, still require Tarek's explicit approval before saving. Project README updates and project-specific workflow links do not require per-edit approval.
12. Never create session logs, conversation summaries, transcripts, hand-offs, agent-log rows, inbox captures, journal entries, or routine activity histories through this integration.

## Separation of authority

- Project `AGENTS.md`: rules for working inside that code repository.
- Project code/configuration/tests: evidence of what is actually implemented.
- Vault project README: canonical cross-model project context and current summary.
- `agents/workflows/`: reusable methods that tell agents how to perform recurring work.
- Vault `AGENTS.md`, router, Agent Write Method, and Obsidian conventions: rules for reading/writing the vault.

See [README.md](README.md) for installation and [INIT-PROMPT.md](INIT-PROMPT.md) for the manual fallback.
