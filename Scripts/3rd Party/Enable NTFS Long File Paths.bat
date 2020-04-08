@echo off
title Windows10Tools - Enable NTFS Long File Paths
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM Code snippets from https://github.com/freshollie/Enable-Long-Filepaths-NTFS/blob/master/Enable.bat
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
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /f /V LongPathsEnabled /T REG_DWORD /D 1
echo
echo Complete!
pause