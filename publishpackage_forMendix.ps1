Param(
    [Parameter(Mandatory=$true)]
    [string]$version,
	[string]$githubToken
)

.\nuget.exe push .\Mendix.LibGit2Sharp.NativeBinaries.$version.nupkg -src https://nuget.pkg.github.com/mendix/index.json -ApiKey $githubToken


