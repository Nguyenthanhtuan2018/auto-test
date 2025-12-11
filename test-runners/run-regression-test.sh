#!/bin/bash
echo "Running Regression Test - Purchase Reward..."

./maestro/maestro/bin/maestro test .maestro/regression/RewardPurchase_AT2025_Independent.yaml --format HTML --output reports/regression-test-report.html @env/env.common @env/env.stg @env/scenario.regression.stg

if [ -f "reports/regression-test-report.html" ]; then
    echo "Test completed! Opening report..."
    # For Linux/Mac - adjust based on your system
    if command -v xdg-open > /dev/null; then
        xdg-open reports/regression-test-report.html
    elif command -v open > /dev/null; then
        open reports/regression-test-report.html
    else
        echo "Please open reports/regression-test-report.html manually"
    fi
else
    echo "Report not found!"
fi