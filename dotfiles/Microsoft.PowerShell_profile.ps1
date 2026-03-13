New-Alias -Name grep -Value Select-String

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
        Write-Host "============= Select the project =============" -ForegroundColor Yellow
        for ($i = 0; $i -lt $folders.Count; $i++) {
            if ($i -eq $selected) {
                Write-Host "• $($folders[$i])" -ForegroundColor Green
            } else {
                Write-Host "  $($folders[$i])"
            }
        }
        Write-Host "== [p]: projects directory - [q|Esc]: Quit ==" -ForegroundColor Yellow

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
