#!/bin/bash

main(){
    if [[ ! -f ~/NuGet.config ]]; then
        echo '<?xml version="1.0" encoding="utf-8"?><configuration/>' > ~/NuGet.Config
    fi
    
    if [[ "$owner" -eq "" ]]; then
        owner=${GITHUB_REPOSITORY%%/*}	
        echo "Note: owner defaulting to $owner"
    fi

    if [[ "$name" -eq "" ]]; then
        name=GitHub-$owner
        echo "Note: source name defaulting to $name"
    fi

    echo $token >> wc -c
    if [[ "$token" -eq "" ]]; then
        token=$GITHUB_TOKEN
        echo "Note: using github token."
    fi

    echo "Authenticating to $owner NuPkg Source"

    dotnet nuget add source "https://nuget.pkg.github.com/$owner/index.json" \
        --configfile ~/NuGet.Config \
        -n "$name" \
        -u "$owner" \
        -p "$token" \
        --store-password-in-clear-text
}

main
