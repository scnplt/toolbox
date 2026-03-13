Invoke-Expression (&starship init powershell)

New-Alias -Name grep -Value Select-String

function cc { 
    Clear-Host
    claude code
}

function l { Get-ChildItem }

function d { Set-Location ~\Desktop }

function conf { code $PROFILE }

function gitl { git log --oneline --graph --decorate }

function clearHistory { Remove-Item (Get-PSReadlineOption).HistorySavePath }

function ports { netstat -aof }

function pp { Set-Location $env:PROJECTS_HOME }

function p([string]$project_name = "") {
    if ($project_name -ne "") { return Set-Location $env:PROJECTS_HOME/$project_name }

    $folders = Get-ChildItem -Path $env:PROJECTS_HOME -Directory | Select-Object -ExpandProperty Name;

    $running = $true
    $selected = 0
    $rowCount = $folders.Count + 2
    $clearPreviousOutput = "$([char]27)[$($rowCount)A$([char]27)[J"

    while ($running) {
        Write-Host "`n============= Select a project =============" -ForegroundColor Yellow
        for ($i = 0; $i -lt $folders.Count; $i++) {
            if ($i -eq $selected) {
                Write-Host "• $($folders[$i])" -ForegroundColor Green
            } else {
                Write-Host "  $($folders[$i])"
            }
        }

        $input = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        switch ($input.VirtualKeyCode) {
            {$_ -in 40,74} { # j or down
                $selected = ($selected + 1) % $folders.Count
                Write-Host -NoNewLine $clearPreviousOutput
            } 
            {$_ -in 38,75} { # k or up
                $selected = ($selected - 1 + $folders.Count) % $folders.Count 
                Write-Host -NoNewLine $clearPreviousOutput
            }
            {$_ -in 27,81} { $running = $false } # q or esc
            80 { return Set-Location $env:PROJECTS_HOME } # p
            13 { return Set-Location $env:PROJECTS_HOME/$($folders[$selected]) } # enter
        }
    }
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
