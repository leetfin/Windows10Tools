@echo off
title Windows10Tools - Thumbnail Cache Cleaner
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM Script source https://github.com/ne2k/windows10_icon_cache_cleaner - modified for Windows10Tools
taskkill /f /im explorer.exe
timeout 2
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
timeout 2
start explorer.exe
echo Complete.
pause