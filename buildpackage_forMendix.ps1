Param(
    [Parameter(Mandatory=$true)]
    [string]$version
)

.\nuget.exe Pack nuget.package\MendixBinaries.nuspec -Version $version -NoPackageAnalysis
