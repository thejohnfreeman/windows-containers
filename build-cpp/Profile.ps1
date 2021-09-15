Set-Alias touch New-Item
Set-Alias which Get-Command
Function whoami { $env:USERNAME }
# We tried to change $COMSPEC to choose the shell in Make,
# but changing this variable now seems to hang PowerShell.
# The problem of configuring the Make shell remains.
# https://lists.gnu.org/archive/html/make-w32/2021-09/threads.html
#$env:COMSPEC = powershell.exe
Function time() {
  $command = $args -join ' '
  Measure-Command { Invoke-Expression $command | Out-Default }
}
