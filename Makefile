SHELL = /usr/bin/env bash

all: web
web:
	ansible-playbook playbooks/main.yml \
	-i playbooks/inventory/inventory.txt
