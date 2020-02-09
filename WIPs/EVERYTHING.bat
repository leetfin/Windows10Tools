@echo off
color 17
echo THIS WILL EXECUTE EVERY SCRIPT.
pause
start FullDebloat.bat
timeout 30
start StopWindowsUpdate.bat
timeout 3
start NeverPowerDown.bat
timeout 15
start "Uninstall OneDrive.bat"
pause