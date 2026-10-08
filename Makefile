all:
	./.scripts/create-structure.sh
	./.scripts/clone-repos.sh
	./.scripts/link-subjects.sh

.PHONY: all
