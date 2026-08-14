Invoke-Expression (&starship init powershell)
Import-Module CompletionPredictor
Import-Module Terminal-Icons

# Conf
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadlineOption -PredictionViewStyle ListView
Set-PSReadlineOption -EditMode Windows

# Aliases
Set-Alias -Name l -Value Get-ChildItem

# Navigation
function d { Set-Location ~\Desktop }
function p { Set-Location $env:PROJECTS_HOME }

# Git
function glo { git log --oneline --graph --decorate }
function gpsh { git push }
function gst { git status }
function gpl { git pull }
function gcm([string]$msg) { git commit -m "$msg" }
function gcl([string]$rp) { git clone "https://github.com/$rp" }

# Other
function clearHistory {  Remove-Item (Get-PSReadlineOption).HistorySavePath }
function conf { code $PROFILE }
function ports { netstat -aof }

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
