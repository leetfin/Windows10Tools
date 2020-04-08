# Script from https://github.com/L33Tech/Windows10Tools
@echo off
title Windows10Tools - Windows Update Stop
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM Code snippets from unknown source.
echo Now stopping Windows Update.....
stop-service wuauserv
set-service wuauserv -startuptype disabled
echo Complete!
pause