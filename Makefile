.PHONY: help

help: #Self-documents targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'


build: ## Build container
	docker build -t python-infra .

run: ## Run container
	docker run -p 5000:5000 python-infra

up: build run ## Build and run container
