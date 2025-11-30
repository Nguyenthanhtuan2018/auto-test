@echo off
echo Running Smoke Test...

.\maestro\maestro\bin\maestro test .maestro\smoke\Smoke_All_FromLogin.yaml --format HTML --output reports\smoke-test-report.html @env/env.common @env/env.stg @env/scenario.smoke.stg

if exist reports\smoke-test-report.html (
    echo Test completed! Opening report...
    start reports\smoke-test-report.html
) else (
    echo Report not found!
)
