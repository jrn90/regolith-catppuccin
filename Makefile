default: help

## This help message
help:
	@printf "\n"
	@awk '/^[a-zA-Z\-\0-9%:\\]+/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
    if (helpMessage) { \
      helpCommand = $$1; \
      helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
  	gsub("\\\\", "", helpCommand); \
  	gsub(":+$$", "", helpCommand); \
    printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
    } \
  } \
  { lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"

## Install theme
install:
	@bash ./scripts/install.sh	

## Remove theme 
remove:
	@bash ./scripts/remove.sh

.PHONY: help install remove
