@echo off
setlocal
set "VAULT_LINK_BASH=%ProgramFiles%\Git\bin\bash.exe"
if exist "%VAULT_LINK_BASH%" goto launch
for %%I in (git.exe) do set "VAULT_LINK_BASH=%%~dp$PATH:I..\bin\bash.exe"
if exist "%VAULT_LINK_BASH%" goto launch
if exist "%LocalAppData%\Programs\Git\bin\bash.exe" (
    set "VAULT_LINK_BASH=%LocalAppData%\Programs\Git\bin\bash.exe"
    goto launch
)
echo [vault-link] Git Bash not found. Install Git for Windows. 1>&2
exit /b 1

:launch
"%VAULT_LINK_BASH%" "%~dp0vault-link" %*
exit /b %ERRORLEVEL%
