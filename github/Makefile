.DEFAULT_GOAL := default

platform := $(shell uname)

default: build

build:
	terraform apply

import:
	terraform import github_repository.content_website 12factor.io;
	terraform import github_repository.ci_goto_terraform goto-terraform;
	terraform import github_repository.engineering_cab_tester cab-tester;
	terraform import github_repository.engineering_middleman_12factor middleman-12factor;

destroy:
	terraform state rm github_repository.content_website;
	terraform state rm github_repository.ci_goto_terraform;
	terraform state rm github_repository.engineering_cab_tester;
	terraform state rm github_repository.engineering_middleman_12factor;

	terraform destroy


install:
	@if [ ! -f ~/.terraform.d/plugins/terraform-provider-codeowners ]; then \
		curl -o ~/.terraform.d/plugins/codeowners.zip -L https://github.com/form3tech-oss/terraform-provider-codeowners/releases/download/v0.2.7/terraform-provider-codeowners_0.2.7_${platform}_amd64.zip; \
		unzip ~/.terraform.d/plugins/codeowners.zip -d  ~/.terraform.d/plugins/; \
		rm ~/.terraform.d/plugins/codeowners.zip; \
		chmod +x ~/.terraform.d/plugins/terraform-provider-codeowners_v0.2.7; \
		terraform init; \
	fi
