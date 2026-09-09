# Intelligent Link Router

Delivery baseline for a Go HTTP service: local stack, infrastructure as code and a pipeline that goes from commit to a running service on AWS ECS. The application itself is deliberately small. What this repository documents is the path a service takes from a laptop to production.

## Status

The API currently exposes a health endpoint and a root handler. The build, infrastructure and deployment layers around it are the actual content of the repository.

## What is wired
- Go HTTP server configured through environment variables, with request logging middleware and a read header timeout.
Docker Compose stack running the API, PostgreSQL and Redis for local development.
Terraform baseline with the AWS provider for infrastructure as code.
GitHub Actions for continuous integration, for releases with a generated changelog, and for deployment.
Deploy workflow that assumes an IAM role, pushes the image to ECR and updates an ECS service.
Makefile targets for everyday tasks and a PowerShell script for deploying from Windows.

## Local stack

```bash
make up
curl http://localhost:8080/healthz
```

API on port 8080, PostgreSQL on 5432, Redis on 6379.

## Make targets

up, down, logs, fmt, lint, test, build, run, deploy

## Configuration

Start from .env.example. PORT, DATABASE_URL and REDIS_URL configure the service. AWS_ROLE_ARN, AWS_REGION, ECR_REPOSITORY, ECS_CLUSTER and ECS_SERVICE configure the deploy workflow.

## Stack

Go, Docker Compose, Terraform, AWS (ECR and ECS), GitHub Actions, PostgreSQL and Redis.
