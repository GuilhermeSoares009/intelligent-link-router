SHELL := /usr/bin/env bash
API_DIR := apps/api
DOCKER_COMPOSE := docker compose

.PHONY: up down logs fmt lint test build run deploy

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

logs:
	$(DOCKER_COMPOSE) logs -f

fmt:
	cd $(API_DIR) && gofmt -w ./

lint:
	cd $(API_DIR) && go vet ./...

test:
	cd $(API_DIR) && go test ./...

build:
	cd $(API_DIR) && go build -o ../../bin/api ./cmd/api

run:
	cd $(API_DIR) && go run ./cmd/api

deploy:
	powershell -ExecutionPolicy Bypass -File scripts/deploy.ps1
