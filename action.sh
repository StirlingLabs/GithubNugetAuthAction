#!/bin/bash

main(){
	if [[ ! -f ~/NuGet.config ]]; then
		echo '<?xml version="1.0" encoding="utf-8"?><configuration/>' > ~/NuGet.Config
	fi
	
	if [[ "$owner" -eq "" ]]; then
		owner=${GITHUB_REPOSITORY%%/*}	
		echo "Warning: owner defaulting to $owner"
	fi

	if [[ "$name" -eq "" ]]; then
		name=GitHub-$owner
		echo "Warning: source name defaulting to $name"
	fi

	if [[ "$token" -eq "" ]]; then
		echo "Error: token must be set." > /dev/stderr
		exit 1
	fi

	echo "Authenticating to $repository_owner NuPkg Source" > /dev/stderr

	dotnet nuget add source "https://nuget.pkg.github.com/$owner/index.json" \
		--configfile ~/NuGet.Config \
    	-n "$name" \
        -u "$owner" \
        -p "$token" \
        --store-password-in-clear-text
}

main
