.DEFAULT_GOAL := default

platform := $(shell uname)

default: install build

build:
	terraform apply

install:
	@if [ ! -f ~/.terraform.d/plugins/terraform-provider-googlecalendar ]; then \
		curl -o ~/.terraform.d/plugins/googlecalendar.tgz -L https://github.com/sethvargo/terraform-provider-googlecalendar/releases/download/v0.1.0/terraform-provider-googlecalendar_0.1.0_${platform}_amd64.tgz; \
		tar -xvf  ~/.terraform.d/plugins/googlecalendar.tgz -C  ~/.terraform.d/plugins/; \
		rm ~/.terraform.d/plugins/googlecalendar.tgz; \
		chmod +x ~/.terraform.d/plugins/terraform-provider-googlecalendar; \
		terraform init; \
	fi
