@echo off
title Windows10Tools - Lockscreen Image Downloader  
REM This script is a part of Windows10Tools. Find it here: https://github.com/L33Tech/Windows10Tools
REM Code snippets from https://github.com/ivaruf/w10-lockscreen-fetcher/blob/master/w10.bat and https://github.com/TeslaX93/Win10LockScreenDownloader/blob/master/w10wallp.cmd
@echo off
setlocal
REM Size is in bytes
set "min.size=100000"

mkdir C:\W10-Backgrounds
pushd C:\W10-Backgrounds

REM Strip all jpg file extensions (for rerunning script)
ren *.jpg *.

REM Copy files from assets, overwrite duplicates
copy /b/v/y C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\* .

REM Add back file extensions
ren * *.jpg

REM Delete small files (they are icons and ads, don't want em)
for /f  "usebackq delims=;" %%A in (`dir /b /A:-D *.*`) do If %%~zA LSS %min.size% del "%%A"

popd

echo Complete!
pause
REM unused smaller version of script 
REM @echo off
REM mkdir output
REM robocopy "%localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets" output /MIN:102400
REM cd output
REM ren *. *.jpg
REM del /q *.
REM exit