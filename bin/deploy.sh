#!/usr/bin/env bash

set -e

if [[ "false" != "$TRAVIS_PULL_REQUEST" ]]; then
	echo "Not deploying pull requests."
	exit
fi

if [[ "master" != "$TRAVIS_BRANCH" ]]; then
	echo "Not on the 'master' branch."
	exit
fi

git config user.name $GIT_USER
git config user.email $GIT_EMAIL

kumogata convert 001.rb > json/001.json
kumogata convert 001-mod.rb > json/001-mod.json
kumogata convert 001-hvm-aurora.rb > json/001-hvm-aurora.json
kumogata convert 001-woo-aurora.rb > json/001-woo-aurora.json
kumogata convert 001-mod-aurora.rb > json/001-mod-aurora.json
kumogata convert 001-woo-hvm.rb > json/001-woo-hvm.json
kumogata convert 001-woo-mod.rb > json/001-woo-mod.json
kumogata convert as-hvm.rb > json/as-hvm.json

git status
git add json
git commit --quiet -m "Deploy from travis"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1
