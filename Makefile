# https://suva.sh/posts/well-documented-makefiles/#simple-makefile
.DEFAULT_GOAL:=help
SHELL:=/bin/bash

GIT_REVISION:=$(shell git rev-parse --short HEAD)

.PHONY: help plan apply destroy

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)


plan: ## Run terraform plan
	terraform validate
	terraform plan -var git_revision=$(GIT_REVISION)

apply: ## Run terraform apply
	terraform apply -var git_revision=$(GIT_REVISION) --auto-approve

destroy: ## Run terraform apply
	terraform destroy --auto-approve

