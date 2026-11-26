# vault-link

Connect a code project to a local or Git-hosted knowledge vault and make that vault available to the project's AI agent as a **Second Brain**.

The project remains the agent's workspace and source of truth for code. Its own `AGENTS.md` governs project work. The linked vault supplies durable context, preferences, reusable workflows, and skills; the vault's own `AGENTS.md` governs every vault read and write.

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

Run it from the project root, or pass the project directory as the last argument. Pick one source.

```bash
vault-link --local "$HOME/TarekVault"
vault-link --repo "https://github.com/you/vault"
```

| Source | Use it when |
| --- | --- |
| `--local DIR` | The vault is a folder on this machine. |
| `--repo GIT_URL` | The vault is a Git repository. It is cloned into a cache and refreshed on update. |

Preview without writing or cloning:

```bash
vault-link --check --local "$HOME/TarekVault"
vault-link --check --repo "https://github.com/you/vault"
```

Use a normal `https://` or `ssh://` / `git@` URL. Do not put a token, password, query string, or fragment in the URL. Private repositories use the Git credentials already configured on the machine.

Refresh the saved source later:

```bash
vault-link --update
```

A repository link fast-forwards its cache. A local link reads the folder as it is now. Run `--local` or `--repo` again to switch sources. The cache defaults to `~/.cache/vault-link`; set `VAULT_LINK_CACHE` to move it.

## What changes in the project

| File | Result |
| --- | --- |
| `AGENTS.md` | One managed Second Brain section between `<!-- vault-link:start -->` and `<!-- vault-link:end -->`. Text outside the block is preserved. |
| `CLAUDE.md` and `GEMINI.md` | `@AGENTS.md` is added when that import is missing. Existing lines stay. |
| `.gitignore` | `/.vault-link-local` is ignored. |
| `.vault-link-local` | Records `source` and `vault_path`. A Git source also records `vault_repo`. This file is machine-local. |

The managed instructions establish this workflow:

1. Read the project's `AGENTS.md` first. It remains authoritative for project work.
2. Use the linked vault as shared memory, following the vault's own router, `AGENTS.md`, and writing method for vault operations.
3. Keep the project's README and the vault's concise project README current when meaningful project facts change.
4. Ask Tarek before saving durable personal preferences or habits, cross-project workflows, or reusable skills.
5. Never create session logs, conversation summaries, or routine activity histories.

The tool only links the vault; the agent performs the contextual reading and approved documentation updates. No vault content is copied into the project repository.

## Agent skill

[SKILL.md](SKILL.md) describes how an agent should link, read, and use the vault. [INIT-PROMPT.md](INIT-PROMPT.md) is the manual fallback when the command cannot be run.

## Command

```text
vault-link --install
vault-link [--check] --local DIR [PROJECT_DIR]
vault-link [--check] --repo GIT_URL [PROJECT_DIR]
vault-link [--check | --update] [PROJECT_DIR]
```

## Layout

| Path | Role |
| --- | --- |
| `bin/vault-link` | Cross-platform command. |
| `bin/vault-link.cmd` | Windows launcher. |
| `bin/vault-link.ps1` | PowerShell launcher. |
| `install.sh` / `install.ps1` | Installers. |
| `SKILL.md` | Agent skill. |
| `INIT-PROMPT.md` | Manual linking steps. |

## License

[MIT](LICENSE)
