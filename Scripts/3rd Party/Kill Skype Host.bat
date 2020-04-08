@echo off
title Windows10Tools - Kill Skype Host
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM Code snippets from https://github.com/PiyushArora01/Windows-10-Performance-Fixes/blob/master/KillSkypeHost.bat
:: BatchGotAdmin
REM BatchGotAdmin code sourced from https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
echo
takeown /f "C:\Program Files\WindowsApps\Microsoft.Messaging_2.12.15004.0_x86__8wekyb3d8bbwe\SkypeHost.exe"
icacls "C:\Program Files\WindowsApps\Microsoft.Messaging_2.12.15004.0_x86__8wekyb3d8bbwe\SkypeHost.exe" /grant administrators:f
move "C:\Program Files\WindowsApps\Microsoft.Messaging_2.12.15004.0_x86__8wekyb3d8bbwe\SkypeHost.exe" "%userprofile%\desktop"
ren "%userprofile%\desktop\SkypeHost.exe" "SkypeHost3.exe"
del "%userprofile%\desktop\SkypeHost3.exe"
echo Complete!
pause