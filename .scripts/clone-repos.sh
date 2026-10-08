#!/usr/bin/env bash

DST_DIR="Subjects"

GIT_HOST="git@github.com"
GIT_USER="anvea-nsu"

TOPIC="subjects"
LIMIT="1000"

clone_repo() {
    local repo="${1}"
    git -C ${DST_DIR} clone "${GIT_HOST}:${GIT_USER}/${repo}.git"
}

repos=$(gh repo list ${GIT_USER} --topic ${TOPIC} --limit ${LIMIT} --json name --jq '.[].name')

for repo in $repos; do
    clone_repo "$repo"
done
