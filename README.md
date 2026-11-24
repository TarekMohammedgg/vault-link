# vault-link

Connect a code project to a vault. The vault can be a Markdown folder or an Obsidian vault.

`vault-link` writes one managed section into the project's agent instructions. Cursor, Claude Code, Gemini CLI, and other agents can then find the vault and follow its own rules. The vault stays in its own folder. The project stores only a local pointer, and that pointer is kept out of Git.

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
vault-link --local "$HOME/vault"
vault-link --repo "https://github.com/you/vault"
```

| Source | Use it when |
| --- | --- |
| `--local DIR` | The vault is a folder on this machine. It does not need a marker file or a fixed layout. |
| `--repo GIT_URL` | The vault is a Git repository. It is cloned into a cache and refreshed on update. |

Preview the edits without writing or cloning:

```bash
vault-link --check --local "$HOME/vault"
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
| `AGENTS.md` | One block between `<!-- vault-link:start -->` and `<!-- vault-link:end -->`. Text outside that block is kept. An older `vault-bridge` block is replaced once. |
| `CLAUDE.md` and `GEMINI.md` | `@AGENTS.md` is added when that import is missing. Existing lines stay. |
| `.gitignore` | `/.vault-link-local` is ignored. |
| `.vault-link-local` | Records `source` and `vault_path`. A Git source also records `vault_repo`. This file is machine-local. |

The managed block tells an agent to read `vault_path` from `.vault-link-local`, start at the vault's `AGENTS.md` or top-level `README.md`, and follow that vault's read and write rules.

Run the command from a project directory that is outside the vault folder.

## Agent skill

[SKILL.md](SKILL.md) is the skill an agent should follow when linking or refreshing a vault. [INIT-PROMPT.md](INIT-PROMPT.md) is the manual fallback when the command cannot be run.

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
| `bin/vault-link` | Command. |
| `bin/vault-link.cmd` | Windows launcher. |
| `bin/vault-link.ps1` | PowerShell launcher. |
| `install.sh` | Clone and install on macOS or Linux. |
| `install.ps1` | Clone and install on Windows. |
| `SKILL.md` | Agent skill. |
| `INIT-PROMPT.md` | Manual linking steps. |

## License

[MIT](LICENSE)
