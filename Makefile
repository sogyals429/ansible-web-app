SHELL = /usr/bin/env bash

all: web
web:
	ansible-playbook playbooks/main.yml \
	-i playbooks/inventory/myazure_rm.yml \
	--ask-vault-pass