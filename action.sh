#!/bin/bash

main(){
	if [[ ! -f ~/NuGet.config ]]; then
		echo '<?xml version="1.0" encoding="utf-8"?><configuration/>' > ~/NuGet.Config
	fi

	if [[ "$owner" == "" ]]; then
		owner=${GITHUB_REPOSITORY%%/*}	
		echo "Note: owner defaulting to $owner"
	fi

	if [[ "$name" == "" ]]; then
		name=GitHub-$owner
		echo "Note: source name defaulting to $name"
	fi

	if [[ "$token" == "" ]]; then
		token=$GITHUB_TOKEN
		echo "Note: using github token."
	fi

	echo "Authenticating to $owner NuPkg Source"

	if [[ "$RUNNER_OS" == "Windows" ]]; then
		configfile="$APPDATA\NuGet\NuGet.Config"
		extra_args=
	else
		configfile=~/NuGet.Config
		extra_args=--store-password-in-clear-text
	fi

	dotnet nuget add source "https://nuget.pkg.github.com/$owner/index.json" \
		--configfile $configfile \
		-n "$name" \
		-u "$owner" \
		-p "$token" \
		$extra_args
}

main
