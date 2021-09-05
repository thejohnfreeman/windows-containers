Set-Alias touch New-Item
Set-Alias which Get-Command
Function whoami { $env:USERNAME }
$env:COMSPEC = powershell.exe

Function time() {
  $command = $args -join ' '
  Measure-Command { Invoke-Expression $command | Out-Default }
}
