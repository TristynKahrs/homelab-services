SHELL := /bin/bash

ifneq (,$(wildcard .env))
include .env
export $(shell sed -n 's/^\([^#=]*\)=.*$/\1/p' .env)
endif

compose = docker compose --env-file .env -f compose.yml

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
        $(compose) up -d

down:
        $(compose) down

logs:
        $(compose) logs -f --tail=200
