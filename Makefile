SHELL := /bin/bash

init:
	@test -f .env || cp .env.example .env
	@mkdir -p secrets \
		$(DATA_ROOT)/traefik \
		$(DATA_ROOT)/filebrowser/{db,config} \
		$(DATA_ROOT)/adguard/{work,conf} \
		$(DATA_ROOT)/wireguard \
		$(DATA_ROOT)/portainer \
		$(DATA_ROOT)/borgmatic/{config,cache,ssh}
	@touch $(DATA_ROOT)/traefik/dynamic.yml
	@echo "Init complete. Edit .env, then run make up"

up:
	docker compose -f stacks/compose.yml --env-file .env up -d

down:
	docker compose -f stacks/compose.yml --env-file .env down

logs:
	docker compose -f stacks/compose.yml logs -f --tail=200
