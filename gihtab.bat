@echo off
setlocal

:: Default Variables
set USER_PROFILE="dev-jakko"

:: github
if "%1"=="" (
    start "" "https://github.com"
    exit /b
)

:: --profile
if "%1"=="--profile" (
    if "%2"=="" (

        :: github --profile
        start "" "https://github.com/%USER_PROFILE%"
        exit /b
    ) else if not "%2"=="-h" (

        :: github --profile [username]
        start "" "https://github.com/%2"
        exit /b 
    )

    :: -repo
    if "%2"=="--repo" (
        if "%3"=="" (
            echo Invalid usage of "--repo". Use "github --profile -h" for a list of commands.
            exit /b
        ) else (

            :: github --profile --repo [name]
            start "" "https://github.com/%USER_PROFILE%/%3"
            exit /b
        )
    ) else if "%3"=="--repo" (
        if "%4"=="" (
            echo Invalid usage of "--repo". Use "github --profile -h" for a list of commands.
            exit /b
        ) else (

            :: github --profile [username] --repo [name]
            start "" "https://github.com/%2/%4"
            exit /b
        )
    )
)

:: github -h
if "%1"=="-h" (
    cls
    echo.
    echo   github                          Opens GitHub
    echo   github -h                       Lists GitHub commands
    echo   github --profile                Opens default GitHub profile
    echo.
    echo   * Use "github --[flag] -h" for more detailed descriptions of certain commands. *
    echo.
    exit /b
)

:: github --profile -h
if "%1"=="--profile" if "%2"=="-h" (
    echo.
    echo   github --profile                                  Opens the default GitHub profile.
    echo   github --profile [username]                       Opens the GitHub profile of the specified user.
    echo.
    echo   github --profile --repo [name]                    Opens the specified repo from the default profile.
    echo   github --profile [username] --repo [repo]         Opens the specified repo from the specified profile.
    echo.
    exit /b
)

:: Invalid command
echo Invalid usage of "github". Use "github -h" for a list of commands.
exit /b

endlocal