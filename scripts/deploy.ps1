$ErrorActionPreference = "Stop"

$required = @("AWS_REGION", "AWS_ROLE_ARN", "ECR_REPOSITORY", "ECS_CLUSTER", "ECS_SERVICE")
$missing = @()
foreach ($name in $required) {
  if (-not $env:$name) {
    $missing += $name
  }
}

if ($missing.Count -gt 0) {
  Write-Error "Missing required env vars: $($missing -join ', ')"
  exit 1
}

Write-Host "Deploy step placeholder. Configure CI to build and deploy via ECS."
