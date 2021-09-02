curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x64.zip -o powershell.zip
md powershell
tar -xf ../powershell.zip -C powershell
xcopy /E /C /H /Y powershell\* C:\Windows\System32
rmdir /S /Q powershell
del powershell.zip
