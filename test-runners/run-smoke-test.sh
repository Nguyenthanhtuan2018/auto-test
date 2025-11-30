#!/bin/bash

# Load environment variables (new structure)
source <(grep -v '^#' env/env.common | sed 's/-e /export /')
source <(grep -v '^#' env/env.stg | sed 's/-e /export /')
source <(grep -v '^#' env/scenario.smoke.stg | sed 's/-e /export /')

# Run smoke test with HTML report
./maestro/maestro/bin/maestro test .maestro \
  --include-tags smokeTest \
  --format HTML \
  --output reports/smoke-test-report.html \
  -e APP_ID="$APP_ID" \
  -e API_BASE_URL="$API_BASE_URL" \
  -e LOGIN_PATH="$LOGIN_PATH" \
  -e LOGIN_PHONE="$LOGIN_PHONE" \
  -e LOGIN_PASSWORD="$LOGIN_PASSWORD" \
  -e LOGIN_MOBILE="$LOGIN_MOBILE" \
  -e LOGIN_DEVICE_ID="$LOGIN_DEVICE_ID"

echo "Test completed. Report: reports/smoke-test-report.html"
