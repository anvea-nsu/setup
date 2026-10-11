#!/usr/bin/env bash

set -e

GIT_HOST="git@github.com"
GIT_USER="anvea-nsu"

LIMIT="1000"

mkdir -p Subjects Semesters/{1..8}/Subjects

repos=$(gh repo list ${GIT_USER} --topic subjects --limit ${LIMIT} --json name --jq '.[].name')

for repo in $repos; do
	if [ ! -d "Subjects/${repo}" ]; then
		git -C Subjects clone "${GIT_HOST}:${GIT_USER}/${repo}.git"
	else
		echo "Repository ${repo} already cloned. Skipping."
	fi
done

for i in {1..8}; do
	repos=$(gh repo list ${GIT_USER} --topic subjects --topic semester-${i} --limit ${LIMIT} --json name --jq '.[].name')

	relative_path="../../../Subjects"

	for repo in $repos; do
		if [ ! -L "Semesters/${i}/Subjects/${repo}" ]; then
			ln -s "${relative_path}/${repo}" "Semesters/${i}/Subjects/"
		fi
	done
done

