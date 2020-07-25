SHELL = /usr/bin/env bash

all: web
web:
				ansible-playbook tasks/main.yml \
        -i inventory/inventory.txt
