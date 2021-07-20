
main(){
	if [[ ! -f ~/NuGet.config ]]; then
		echo '<?xml version="1.0" encoding="utf-8"?><configuration/>' > ~/NuGet.Config
	fi
	
	if [[ "$repository_owner" == "" ]]; then
		repository_owner=$this_repo_owner
	fi

	if [[ "$token" == "" ]]; then
		echo "Error: token must be set." > /dev/stderr
		exit 1
	fi

	echo "Authenticating to $repository_owner NuPkg Source" > /dev/stderr

	dotnet nuget add source https://nuget.pkg.github.com/$repository_owner/index.json \
		--configfile ~/NuGet.Config \
    	-n GitHub-$repository_owner \
        -u $repository_owner \
        -p $token \
        --store-password-in-clear-text
}

main
