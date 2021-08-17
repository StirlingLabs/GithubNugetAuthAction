# 🔓 GitHub NuPkg Source Authorisation Action

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/a75ea2af278f4d88bc71cc8ca2cae6e6)](https://www.codacy.com/gh/StirlingLabs/GithubNugetAuthAction/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=StirlingLabs/GithubNugetAuthAction&amp;utm_campaign=Badge_Grade)

> Authorises access to a private GitHub NuGet package source, so you can restore packages.

## ⚠️ Warning

- This Action writes the PAT value to disk in plain text... because NuGet requires that on linux.
- Please ensure that you scope the PAT to only read packages *and that you are prepared to accept the risk of the PAT escaping*.

## 🚀 Quickstart

```yaml
      - name: Authorise NuGet
        uses: StirlingLabs/GithubNugetAuthAction@main
        with:
          owner: ${{github.repository_owner}}
          name: MyNuPkgRepo
          token: ${{secrets.NUGET_PAT}}
      - name: Restore NuPkg
        run: dotnet restore SolutionName.sln
```

## Parameters

|Name|Function|
|-|-|
|owner|The owner of the package repository, defaults to the owner of the repository the Action is running within.|
|name|Name of the package repository, defaults to "GitHub-$owner".|
|token|Personal Access Token with permission to read packages.|
