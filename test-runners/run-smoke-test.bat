@echo off
echo Running Smoke Test with ENV files...

REM Load from env files
for /f "tokens=1,2 delims==" %%a in (env\env.stg) do (
    if "%%a"=="export APP_ID" set APP_ID=%%b
    if "%%a"=="export API_BASE_URL" set API_BASE_URL=%%b
    if "%%a"=="export LOGIN_PATH" set LOGIN_PATH=%%b
)

for /f "tokens=1,2 delims==" %%a in (env\flow.login) do (
    if "%%a"=="export LOGIN_PHONE" set LOGIN_PHONE=%%b
    if "%%a"=="export LOGIN_PASSWORD" set LOGIN_PASSWORD=%%b
    if "%%a"=="export LOGIN_MOBILE" set LOGIN_MOBILE=%%b
    if "%%a"=="export LOGIN_DEVICE_ID" set LOGIN_DEVICE_ID=%%b
)

echo APP_ID=%APP_ID%
echo LOGIN_PHONE=%LOGIN_PHONE%

.\maestro\maestro\bin\maestro test .maestro --include-tags smokeTest --format HTML --output reports\smoke-test-report.html -e APP_ID=%APP_ID% -e API_BASE_URL=%API_BASE_URL% -e LOGIN_PATH=%LOGIN_PATH% -e LOGIN_PHONE=%LOGIN_PHONE% -e LOGIN_PASSWORD=%LOGIN_PASSWORD% -e LOGIN_MOBILE=%LOGIN_MOBILE% -e LOGIN_DEVICE_ID=%LOGIN_DEVICE_ID%

if exist reports\smoke-test-report.html (
    echo Test completed! Opening report...
    start reports\smoke-test-report.html
) else (
    echo Report not found!
)
