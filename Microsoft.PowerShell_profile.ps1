# ─────────────────────────────────────────────
#  Oh My Posh – kushal theme
# ─────────────────────────────────────────────
oh-my-posh init pwsh --config "$env:USERPROFILE\.config\ohmyposh\kushal.omp.json" | Invoke-Expression

# ─────────────────────────────────────────────
#  Modules
# ─────────────────────────────────────────────
Import-Module Terminal-Icons   # icons in ls / Get-ChildItem
Import-Module posh-git         # git info helpers

# ─────────────────────────────────────────────
#  PSReadLine – syntax highlighting + smart history
# ─────────────────────────────────────────────
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab       -Function MenuComplete

# Syntax colours
Set-PSReadLineOption -Colors @{
    Command   = '#7EC8E3'
    Parameter = '#C3E88D'
    String    = '#F78C6C'
    Operator  = '#89DDFF'
    Variable  = '#FFCB6B'
    Comment   = '#546E7A'
    Keyword   = '#C792EA'
    Error     = '#F07178'
}

# ─────────────────────────────────────────────
#  zoxide – smart cd
# ─────────────────────────────────────────────
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ─────────────────────────────────────────────
#  Handy aliases & functions
# ─────────────────────────────────────────────
Set-Alias ll Get-ChildItem
Set-Alias g git
Set-Alias touch New-Item

function which ($cmd) { Get-Command $cmd | Select-Object -ExpandProperty Source }
function reload { . $PROFILE }
function up { Set-Location .. }

# Show directory contents on cd
function cdl ([string]$path = '.') { Set-Location $path; Get-ChildItem }
