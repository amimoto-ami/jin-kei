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

rm -fr .git
rm -f .gitignore

git init
git config user.name $GIT_USER
git config user.email $GIT_EMAIL

kumogata convert 001.rb > json/001.json
kumogata convert 001-mod.rb > json/001-mod.json
kumogata convert 001-hhvm.rb > json/001-hhvm.json
kumogata convert 001-hvm-aurora.rb > json/001-hvm-aurora.json
kumogata convert 001-woo-aurora.rb > json/001-woo-aurora.json
kumogata convert 001-mod-aurora.rb > json/001-mod-aurora.json
kumogata convert 001-hhvm-aurora.rb > json/001-hhvm-aurora.json
kumogata convert 001-woo-hhvm.rb > json/001-woo.json
kumogata convert 001-woo-hvm.rb > json/001-woo-hvm.json
kumogata convert 001-woo-mod.rb > json/001-woo-mod.json

git add json
git commit --quiet -m "Deploy from travis"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" travis > /dev/null 2>&1
