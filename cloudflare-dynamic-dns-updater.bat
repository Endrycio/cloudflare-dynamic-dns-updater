@echo off
setlocal

REM === CONFIGURATION ===
set ZONE_ID=YOUR_ZONE_ID
set RECORD_ID=YOUR_RECORD_ID
set API_TOKEN=YOUR_API_TOKEN
set RECORD_NAME=YOUR_RECORD_NAME :: @ for root

REM === Get current date and time ===
for /f "tokens=1 delims=" %%a in ('date /t') do set TODAY=%%a
for /f "tokens=1 delims=" %%b in ('time /t') do set TIME=%%b

REM Format comment
set COMMENT=dns A record updated on: %TODAY% %TIME%

REM === Get public IP address ===
for /f "tokens=*" %%i in ('curl -s https://api.ipify.org') do set CURRENT_IP=%%i

REM === Cloudflare API Request ===
start /B curl -X PUT "https://api.cloudflare.com/client/v4/zones/%ZONE_ID%/dns_records/%RECORD_ID%" ^
-H "Authorization: Bearer %API_TOKEN%" ^
-H "Content-Type: application/json" ^
--data "{\"type\":\"A\",\"name\":\"%RECORD_NAME%\",\"content\":\"%CURRENT_IP%\",\"ttl\":60,\"proxied\":false,\"comment\":\"%COMMENT%\"}"

REM Wait briefly to allow curl to complete
timeout /t 5 > nul

REM Error handling
IF %ERRORLEVEL% NEQ 0 (
    echo Error! Failed to update IP. Exit code: %ERRORLEVEL%
    pause
) ELSE (
    echo Done. IP updated to %CURRENT_IP%
)

endlocal
