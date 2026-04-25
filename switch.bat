@echo off
setlocal enabledelayedexpansion

:: --- CONFIGURATION ---
:: List your remote servers here (space separated)
set SERVERS=136.113.213.213 34.32.46.47
set SSH_USER=abc
set SSH_PASS=123
set LOCAL_PORT=1080
set ROTATION_TIME=10

:LOOP
for %%S in (%SERVERS%) do (
    echo [!] Connecting to %%S...
    
    :: Start the tunnel in the background using start /b
    :: -D is dynamic port, -N is no shell, -pw is password
    start /b "" plink.exe -batch -D %LOCAL_PORT% -N -pw %SSH_PASS% %SSH_USER%@%%S
    
    echo [v] Tunnel active on port %LOCAL_PORT% via %%S.
    timeout /t %ROTATION_TIME% /nobreak >nul
    
    echo [x] Rotating... Closing connection to %%S.
    taskkill /f /im plink.exe >nul 2>&1
)
goto LOOP