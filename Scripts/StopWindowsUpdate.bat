# Script from https://github.com/L33Tech/Windows10Tools

stop-service wuauserv
set-service wuauserv -startuptype disabled
pause