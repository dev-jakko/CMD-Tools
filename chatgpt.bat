@echo off
setlocal

:: Default Variables
set MAIN_GPT="YyyyMT9XH-chatgpt-classic"

:: chatgpt
if "%1"=="" (
    start "" "https://chatgpt.com"
    exit /b
)

:: --gpt
if "%1"=="--gpt" (
    if "%2"=="" (

        :: chatgpt --gpt
        start "" "https://chatgpt.com/g/g-%MAIN_GPT%"
    ) else if "%2"=="wolfram" (

        :: chatgpt --gpt wolfram
        start "" "https://chatgpt.com/g/g-0S5FXLyFN-wolfram"
        exit /b
    ) else if not "%2"=="-h" (
        echo Invalid usage of "--gpt". Use "github --gpt -h" for a list of commands.
    )
)

:: chatgpt --gptlist
if "%1"=="--gptlist" (
    echo.
    echo   wolfram
    echo.
)

:: chatgpt --gptsearch
if "%1"=="--gptsearch" (
    start "" "https://chatgpt.com/gpts"
    exit /b
)

:: chatgpt --settings
if "%1"=="--settings" (
    start "" "https://chatgpt.com/#settings"
    exit /b
)

:: chatgpt --temp
if "%1"=="--temp" (
    start "" "https://chatgpt.com/?temporary-chat=true"
    exit /b
)

:: chatgpt -h
if "%1"=="-h" (
    echo.
    echo   chatgpt                          Opens ChatGPT.
    echo   chatgpt -h                       Lists ChatGPT commands.
    echo   chatgpt --gpt                    Opens default ChatGPT GPT.
    echo   chatgpt --gptlist                Displays list of useable GPTs.
    echo   chatgpt --gptsearch              Opens GPT search.
    echo   chatgpt --settings               Opens ChatGPT settings.
    echo   chatgpt --temp                   Opens ChatGPT temporary chat.
    echo.
)

:: chatgpt --gpt -h
if "%1"=="--gpt" ( if "%2"=="-h" (
    echo.
    echo   chatgpt --gpt                   Opens default GPT.
    echo   chatgpt --gpt [name]            Opens specified GPT.
    echo.
))

:: Invalid command
echo Invalid usage of "chatgpt". Use "chatgpt -h" for a list of commands.
exit /b

endlocal