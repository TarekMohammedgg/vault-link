# vault-link

Connect a code project to a local or Git-hosted knowledge vault and make that vault available to any AI agent as a **shared Second Brain**.

The project's own `AGENTS.md` governs work inside the repository. The linked vault provides cross-model context, canonical project briefs, and reusable workflows.

## Install

Git is required. Windows also needs [Git for Windows](https://git-scm.com/download/win), because the command runs through Git Bash.

**macOS or Linux**

```bash
curl -fsSL https://raw.githubusercontent.com/TarekMohammedgg/vault-link/main/install.sh | bash
```

**Windows PowerShell**

```powershell
irm https://raw.githubusercontent.com/TarekMohammedgg/vault-link/main/install.ps1 | iex
```

The installer clones this repository and copies the command to `~/.local/bin`. Add that directory to your `PATH` if a new terminal does not find `vault-link`. Set `VAULT_LINK_BIN` before installing to choose another directory. Set `VAULT_LINK_SRC` to choose where the clone is stored (`~/.local/share/vault-link`, or `%LOCALAPPDATA%\vault-link` on Windows).

### Install from a checkout

```bash
git clone https://github.com/TarekMohammedgg/vault-link.git
cd vault-link
bash ./bin/vault-link --install
```

On Windows, from the cloned folder:

```powershell
.\bin\vault-link.cmd --install
```

Running the installer again upgrades the command.

## Link a project

Run from the project root, or pass the project directory as the last argument. Pick one source. The normal command is the manual Project → Vault trigger; it never discovers or links other folders.

```bash
vault-link --local "$HOME/TarekVault"
vault-link --repo "https://github.com/you/your-vault"
```

| Source | Use it when |
| --- | --- |
| `--local DIR` | The vault is a folder on this machine. |
| `--repo GIT_URL` | The vault is a Git repository. It is cloned into a cache and refreshed on update. |

Preview without writing or cloning:

```bash
vault-link --check --local "$HOME/TarekVault"
vault-link --check --repo "https://github.com/you/your-vault"
```

Use a normal `https://` or `ssh://` / `git@` URL. Do not put a token, password, query string, or fragment in the URL. Private repositories use the Git credentials already configured on the machine.

### Create a project from the vault

When the user explicitly asks an agent working inside TarekVault to create a code project, the agent creates the project scaffold in the requested local target directory using the supplied source folders/repositories, then invokes the same CLI in explicit programmatic mode:

```powershell
vault-link --link-created --local "D:\Shared\TarekVault" "D:\Projects\my-new-project"
```

For a Git-hosted vault, use `--repo "<credential-free Git URL>"` instead. This command requires an existing project directory and an explicit vault source. It only links/configures the project; the coding agent creates the scaffold. It is idempotent and does not scan, monitor, or auto-link other folders.

Refresh the saved source later:

```bash
vault-link --update
```

## How agents use the vault

1. Read the project's `AGENTS.md` first; it remains authoritative for project work.
2. Sync the vault before reading and before every write.
3. Read the vault router and rules, then the relevant project README and workflow notes.
4. Treat `projects/<slug>/README.md` as the **canonical Agent Project Brief** shared by all models. It is not a copy of the public GitHub README.
5. Update the brief in place when verified project context changes. Keep it concise; replace stale facts rather than appending session history.
6. Reuse workflows in `agents/workflows/` via Obsidian wikilinks. Create a separate note for a genuinely reusable new workflow, add it to the workflows index, and link it from the project brief.
7. Follow the Agent Write Method and Obsidian conventions for all vault notes.
8. Never create session logs, conversation summaries, transcripts, hand-offs, or routine activity histories.

## Authority boundaries

- Project `AGENTS.md`: project-specific working rules.
- Project code/configuration/tests: evidence of implementation.
- Vault project README: canonical cross-model project context.
- `agents/workflows/`: reusable procedures.
- Vault `AGENTS.md`, router, and Agent Write Method: vault operations.

## What changes in the project

| File | Result |
| --- | --- |
| `AGENTS.md` | One managed Second Brain section between the Vault Link markers. Text outside the block is preserved. |
| `CLAUDE.md` and `GEMINI.md` | `@AGENTS.md` is added when that import is missing. |
| `.gitignore` | `/.vault-link-local` is ignored. |
| `.vault-link-local` | Stores the machine-local vault pointer; never commit it. |

The tool links the vault; the agent performs contextual reading and documentation updates. No vault content is copied into the project repository.

## Command

```text
vault-link --install
vault-link [--check] --local DIR [PROJECT_DIR]
vault-link [--check] --repo GIT_URL [PROJECT_DIR]
vault-link --link-created [--check] --local DIR PROJECT_DIR
vault-link --link-created [--check] --repo GIT_URL PROJECT_DIR
vault-link [--check | --update] [PROJECT_DIR]
```

## Layout

| Path | Role |
| --- | --- |
| `bin/vault-link` | Cross-platform command; `--link-created` is the explicit Vault → Project trigger. |
| `bin/vault-link.cmd` | Windows launcher. |
| `bin/vault-link.ps1` | PowerShell launcher. |
| `install.sh` / `install.ps1` | Installers. |
| `SKILL.md` | Agent operating rules. |
| `INIT-PROMPT.md` | Manual linking fallback. |

## License

[MIT](LICENSE)
