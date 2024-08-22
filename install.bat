@echo off
setlocal

set "driverRootFolder=driver"

rem Check if the root folder exists
if not exist "%driverRootFolder%" (
    echo The specified folder does not exist: %driverRootFolder%
    exit /b 1
)

rem install the driver
for /r "%driverRootFolder%" %%f in (*.inf) do (
    echo Installing driver: %%f
    pnputil -i -a "%%f"
    if errorlevel 1 (
        echo Failed to install driver: %%f
    ) else (
        echo Successfully installed driver: %%f
    )
)

echo All drivers installed.
endlocal
pause
