Param(
    [Parameter(Mandatory=$true)]
    [string]$version
)

.\nuget.exe push .\Mendix.LibGit2Sharp.NativeBinaries.%version%.nupkg" --source "github"

