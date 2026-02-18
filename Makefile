SHELL := /usr/bin/env bash

FLUTTER ?= $(shell command -v flutter 2>/dev/null || echo $$HOME/flutter/bin/flutter)
DART ?= $(shell command -v dart 2>/dev/null || echo $$HOME/flutter/bin/dart)

.PHONY: help setup preflight get gen analyze test ci

help:
	@echo "Available targets:"
	@echo "  make setup     - Run environment bootstrap script"
	@echo "  make preflight - Run full tooling + project validation"
	@echo "  make get       - flutter pub get"
	@echo "  make gen       - run build_runner"
	@echo "  make analyze   - flutter analyze"
	@echo "  make test      - flutter test"
	@echo "  make ci        - get + gen + analyze + test"

setup:
	./setup_env.sh

preflight:
	./scripts/preflight.sh

get:
	cd dermalvision && $(FLUTTER) pub get

gen:
	cd dermalvision && $(DART) run build_runner build --delete-conflicting-outputs

analyze:
	cd dermalvision && $(FLUTTER) analyze

test:
	cd dermalvision && $(FLUTTER) test

ci: get gen analyze test
