#!/bin/bash

echo "Running Smoke Test..."

# Run smoke test with HTML report (using @env syntax like .bat)
./maestro/maestro/bin/maestro test .maestro/smoke/Smoke_All_FromLogin.yaml \
  --format HTML \
  --output reports/smoke-test-report.html \
  @env/env.common \
  @env/env.stg \
  @env/scenario.smoke.stg

echo "Test completed. Report: reports/smoke-test-report.html"
