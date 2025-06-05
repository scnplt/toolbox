# Install-Module -Name Terminal-Icons -Repository PSGallery
# Install-Module PS-Menu

Import-Module -Name Terminal-Icons

New-Alias -Name grep -Value Select-String

function l { Get-ChildItem | Format-Wide }

function d { Set-Location ~\Desktop }

function conf { code $PROFILE }

function gitl { git log --oneline --graph --decorate }

function clearHistory() { Remove-Item (Get-PSReadlineOption).HistorySavePath }

function p([string] $project_name = "") { 
    if ($project_name -eq "") {
        $project_path = menu (Invoke-Expression "dir -dir $env:PROJECTS_HOME")
        if ($null -eq $project_path) { return Clear-Host }
        return Set-Location $project_path
    }

    Set-Location $env:PROJECTS_HOME/$project_name
}

function rmf([string] $path) {
    if (!(Test-Path $path)) { return Write-Host "Path `"$path`" doesn't exist!`n" -ForegroundColor Red }
    Write-Host "Are you sure you want to delete `"$path`"?"
    $ans = menu @("Yes", "No")
    if ($ans -eq "Yes") { Remove-Item -Path $path -Force -Recurse; return Write-Host "Deleted!`n" -ForegroundColor Green } 
    Clear-Host
    Write-Host "Aborted`n" -ForegroundColor Red
}