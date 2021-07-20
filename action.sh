
main(){
	if [[ ! -f ~/NuGet.config ]]; then
		echo '<?xml version="1.0" encoding="utf-8"?><configuration/>' > ~/NuGet.Config
	fi
	
	if [[ "$owner" -eq "" ]]; then
		owner=${GITHUB_REPOSITORY%%/*}	
	fi

	if [[ "$token" == "" ]]; then
		echo "Error: token must be set." > /dev/stderr
		exit 1
	fi

	echo "Authenticating to $repository_owner NuPkg Source" > /dev/stderr

	dotnet nuget add source https://nuget.pkg.github.com/$owner/index.json \
		--configfile ~/NuGet.Config \
    	-n GitHub-$owner \
        -u $owner \
        -p $token \
        --store-password-in-clear-text
}

main
