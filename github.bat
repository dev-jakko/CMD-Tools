@echo off
setlocal

:: Default Variables
set USER_PROFILE="dev-jakko"
set MAIN_REPO="CMD-Tools"
set PER_PAGE=20

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
    ) else if "%2"=="--repo" (
        if "%3"=="" (
            start "" "https://github.com/%USER_PROFILE%/%MAIN_REPO%"
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
    ) else if "%2"=="--repolist" (
        
        :: github --profile --repolist
        echo Listing repositories for profile: %USER_PROFILE%
        curl -s "https://api.github.com/users/%USER_PROFILE%/repos?per_page=%PER_PAGE%" | findstr /i /c:"full_name"
        exit /b
    ) else if "%3"=="--repolist" (
        
        :: github --profile [username] --repolist
        echo Listing repositories for profile: %2
        curl -s "https://api.github.com/users/%2/repos?per_page=%PER_PAGE%" | findstr /i /c:"full_name"
        exit /b
    ) else if not "%2"=="-h" (

        :: github --profile [username]
        start "" "https://github.com/%2"
        exit /b
    )
)

:: github -h
if "%1"=="-h" (
    echo.
    echo   github                          Opens GitHub.
    echo   github -h                       Lists GitHub commands.
    echo   github --profile                Opens default GitHub profile.
    echo.
    echo   * Use "github --[flag] -h" for more detailed descriptions of certain commands. *
    echo.
    exit /b
)

:: github --profile -h
if "%1"=="--profile" ( if "%2"=="-h" (
    echo.
    echo   github --profile                                  Opens default GitHub profile.
    echo   github --profile [username]                       Opens GitHub profile of the specified user.
    echo.
    echo   github --profile --repo                           Opens default repo from default profile.
    echo   github --profile --repo [name]                    Opens specified repo from default profile.
    echo   github --profile [username] --repo [name]         Opens the specified repo from the specified profile.
    echo.
    echo   github --profile --repolist                       Displays list of repositories in default GitHub profile.
    echo   github --profile [username] --repolist            Displays list of repositories in specified GitHub profile.
    echo.
    exit /b
))

:: Invalid command
echo Invalid usage of "github". Use "github -h" for a list of commands.
exit /b

endlocal