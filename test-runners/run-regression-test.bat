@echo off
echo Running Regression Test - Purchase Reward...

.\maestro\maestro\bin\maestro test .maestro\regression\RewardPurchase_AT2025_Independent.yaml --format HTML --output reports\regression-test-report.html @env/env.common @env/env.stg @env/scenario.regression.stg

if exist reports\regression-test-report.html (
    echo Test completed! Opening report...
    start reports\regression-test-report.html
) else (
    echo Report not found!
)