@echo off
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM Code snippets from unknown source.
title Windows10Tools - Restore Point Creator
echo Are you sure you would like to continue?
pause
@echo on
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Windows10Tools Restore Point", 100, 12
@echo off
echo Complete! If it didn't work, try running again as admin.
pause
