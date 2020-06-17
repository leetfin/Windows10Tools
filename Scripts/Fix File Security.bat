@echo off
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
title Windows10Tools - File Security Repair Utility
REM BatchGotAdmin code sourced from https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
@echo off
@setlocal enableextensions
@cd /d "%~dp0"
tree
timeout 0
takeown /f * /r /skipsl /d Y
timeout 0
takeown /f * /r /skipsl /d Y
timeout 0
icacls %~dp0 /grant "everyone":(OI)(CI)F
icacls %~dp0 /grant "Authenticated Users":(OI)(CI)F
icacls %~dp0 /grant "system":(OI)(CI)F
icacls %~dp0 /grant "Users":(OI)(CI)F
color A0
echo Operation complete!
pause