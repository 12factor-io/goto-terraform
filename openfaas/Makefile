.DEFAULT_GOAL := default

platform := $(shell uname)

default: build

build:
	terraform apply

destroy:
	terraform destroy
	of-ds-remove


install:
	of-ds-install

install-provider:
	@if [ ! -f ~/.terraform.d/plugins/terraform-provider-openfaas_0.1.0 ]; then \
		curl -o ~/.terraform.d/plugins/openfaas.zip -L https://github.com/ewilde/terraform-provider-openfaas/releases/download/v0.1.0/terraform-provider-openfaas_0.1.0_${platform}_amd64.zip; \
		unzip ~/.terraform.d/plugins/openfaas.zip -d  ~/.terraform.d/plugins/; \
		rm ~/.terraform.d/plugins/openfaas.zip; \
		chmod +x ~/.terraform.d/plugins/terraform-provider-openfaas_0.1.0; \
		terraform init; \
	fi
