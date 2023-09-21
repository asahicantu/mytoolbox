# Powershell default profile settings code.
# Should be exported to C:\Users\<uname>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\bracketed-segments.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\nerd-font-symbols.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\no-empty-icons.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\no-nerd-font.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\no-runtime-versions.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\pastel-powerline.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\pastel-powerline–custom.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\plain-text-symbols.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\pure-preset.toml"
#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\tokyo-night.toml"

Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons

Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
#Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows

Set-Alias d docker
Set-Alias g git
Set-Alias k kubectl
Set-Alias m multipass

function fact {
    irm -Uri https://uselessfacts.jsph.pl/random.json?language=en | Select -ExpandProperty text
}

function joke {
    irm https://icanhazdadjoke.com/ -Headers @{accept = 'application/json' } | select -ExpandProperty joke
}

function 2C {
    param (
        [Parameter()]
        [Alias('Temp')]
        [int]
        $Temperature
    )

  ($Temperature - 30) / 2
}

function 2F {
    param (
        [Parameter()]
        [Alias('Temp')]
        [int]
        $Temperature
    )

  ($Temperature * 2) + 30
}

function update {
    iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
}

function profile {
    code $profile
}

function edit-hist{
    code  (Get-PSReadLineOption).HistorySavePath
}

function edit-starship{
    code $ENV:STARSHIP_CONFIG 
}