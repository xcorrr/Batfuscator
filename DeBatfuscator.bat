@echo off
if "%~1"=="" exit /b
if /i not "%~x1"==".bat" if /i not "%~x1"==".cmd" exit /b

:: Read the original file into a temporary file, excluding the first line (which is `&cls`)
(for /f "skip=1 delims=" %%i in (%~1) do echo %%i) > "%~1__temp"

:: Check if the original file's first line is `&cls` and remove it
findstr /v "^&cls" "%~1__temp" > "%~1"

:: Cleanup
del "%~1__temp"
