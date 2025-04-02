@echo off
setlocal

:: github
if "%1"=="" (
    start "" "https://github.com"
    exit /b
)

:: github --help
if "%1"=="--help" (
    cls
    echo.
    echo   github                    Opens GitHub
    echo   github --help             Lists GitHub commands
    echo.
    exit /b
)

:: Invalid command
echo Invalid usage of "github". Use "github --help" for a list of commands.


endlocal