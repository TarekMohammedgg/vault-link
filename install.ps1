$ErrorActionPreference = 'Stop'
$repo = 'https://github.com/TarekMohammedgg/vault-link.git'
$dest = if ($env:VAULT_LINK_SRC) { $env:VAULT_LINK_SRC } else { Join-Path $env:LOCALAPPDATA 'vault-link' }

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Error '[vault-link] Git for Windows is required.'
}

if (Test-Path -LiteralPath (Join-Path $dest '.git')) {
  git -C $dest pull --ff-only
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
} elseif (Test-Path -LiteralPath $dest) {
  Write-Error "[vault-link] $dest exists and is not a vault-link checkout."
} else {
  $parent = Split-Path -Parent $dest
  if ($parent) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
  git clone --depth 1 $repo $dest
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

& (Join-Path $dest 'bin\vault-link.cmd') --install
exit $LASTEXITCODE
