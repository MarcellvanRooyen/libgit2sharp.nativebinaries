Param(
    [Parameter(Mandatory=$true)]
    [string]$version,
	[string]$githubToken
)

.\nuget.exe push .\Mendix.LibGit2Sharp.NativeBinaries.$version.nupkg -src "github" -ApiKey $githubToken


