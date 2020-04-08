@echo off
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM This script is a port from https://github.com/adolfintel/Windows10-Privacy. All credit to adolfintel.
title Windows10Tools - Windows10Privacy - Prevent License Check
@echo on
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v NoGenTicket /t REG_DWORD /d 1 /f
pause