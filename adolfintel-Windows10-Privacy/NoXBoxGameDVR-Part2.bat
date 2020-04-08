@echo off
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM This script is a port from https://github.com/adolfintel/Windows10-Privacy. All credit to adolfintel.
title Windows10Tools - Windows10Privacy - No XBox and GameDVR Part 2
@echo on
sc delete XblAuthManager
sc delete XblGameSave
sc delete XboxNetApiSvc
sc delete XboxGipSvc
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /f
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
pause