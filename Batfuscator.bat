@echo off
if "%~1"=="" exit /b
if /i not "%~x1"==".bat" if /i not "%~x1"==".cmd" exit /b

where certutil.exe >nul 2>nul || (echo Err: CertUtil not found. & pause & exit /b)

echo //4NCmNscw0K > "temp.~b64"

certutil.exe -f -decode "temp.~b64" "temp_decoded"

del "temp.~b64"

copy /b "temp_decoded" + "%~1" "temp_final"
move /y "temp_final" "%~1"

del "temp_decoded"