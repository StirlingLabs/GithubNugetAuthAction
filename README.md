# 🔓 GitHub External NuPkg Source Authentication Action

> Authenticates an external private GitHub NuGet package source, so you can restore packages.

## ⚠️ Warning

- This Action writes the PAT value to disk in plain text... because NuGet requires that on linux.
- Please ensure that you scope the PAT to only read packages and that you are prepared to accept the risk of the PAT escaping.

## 🚀 Quickstart

```yaml
      - name: Authenticate NuGet
        uses: StirlingLabs/GithubNugetAuthAction@master
        with:
          repository-owner: ${{github.repository_owner}}
          token: ${{secrets.NUGET_PAT}}
      - name: Restore NuPkg
        run: dotnet restore SolutionName.sln
```

## Parameters

|Name|Function|
|-|-|
|repository-owner|The owner of the current repository, defaults to the owner of the repository the Action is running within.|
|token|Personal Access Token with permission to read packages.|
