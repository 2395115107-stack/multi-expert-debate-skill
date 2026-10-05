@echo off
setlocal
set "SRC=%~dp0multi-expert-debate\skills\multi-expert-debate"
if not exist "%SRC%\SKILL.md" (
  echo [x] skill not found: %SRC%
  exit /b 1
)
for %%D in ("%USERPROFILE%\.agents\skills" "%USERPROFILE%\.claude\skills") do (
  if not exist "%%~D" mkdir "%%~D"
  robocopy "%SRC%" "%%~D\multi-expert-debate" /E /PURGE /NFL /NDL /NJH /NJS >nul
)
echo [ok] installed to:
echo   %USERPROFILE%\.agents\skills\multi-expert-debate
echo   %USERPROFILE%\.claude\skills\multi-expert-debate
echo.
echo Restart ZCode / Claude Code, then try: 找几个专家分析一下这个方案
endlocal
