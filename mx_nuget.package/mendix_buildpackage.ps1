Param(
    [string]$version = '0.101.0'
)

# VARIABLES
$scriptDir = Split-Path $MyInvocation.MyCommand.Path

$sourceRuntimesDir = Join-Path $scriptDir "..\nuget.package\runtimes"
$targetRuntimesDir = Join-Path $scriptDir "runtimes"

$sourceBuildPropsPath = Join-Path $scriptDir "..\nuget.package\build\net46\LibGit2Sharp.NativeBinaries.props"
$targetBuildPropsPath = Join-Path $scriptDir "Mendix.LibGit2Sharp.NativeBinaries.props"

# COPY RUNTIMES FOLDER
Copy-Item $sourceRuntimesDir -Destination $targetRuntimesDir -Recurse

# FIX .NET 4.6 BUILD PROPS
$net46BuildProps = [xml](Get-Content $sourceBuildPropsPath)

$excludeNode = $net46BuildProps.SelectSingleNode('Project/ItemGroup/ContentWithTargetPath[@Exclude]')
$excludeNode.ParentNode.RemoveChild($excludeNode)

$dllConfigNode = $net46BuildProps.SelectSingleNode('Project/ItemGroup/ContentWithTargetPath[@TargetPath = ''LibGit2Sharp.dll.config'']')
$dllConfigNode.ParentNode.RemoveChild($dllConfigNode)

$net46BuildProps.Save($targetBuildPropsPath)

# BUILD NUGET PACKAGE
..\nuget.exe Pack Mendix_NativeBinaries.nuspec -Version $version -NoPackageAnalysis

# CLEANUP
Remove-Item $targetRuntimesDir -Recurse
Remove-Item $targetBuildPropsPath
