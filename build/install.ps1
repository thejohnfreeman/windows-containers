$installer = 'vs_buildtools.exe'
$channel = 'vs2019.chman'
Invoke-WebRequest -Uri https://aka.ms/vs/16/release/$installer -OutFile $installer
Invoke-WebRequest -Uri https://aka.ms/vs/16/release/channel -OutFile $channel

$installPath =  'C:\BuildTools'
$workloads = @(
  'Microsoft.VisualStudio.Workload.VCTools'
)
$bootstrapperArgumentList = @(
  '--quiet', '--wait', '--norestart', '--nocache'
  '--installPath', $installPath
  '--channelUri', $channel
  '--installChannelUri', $channel
  '--includeRecommended'
  @($workloads | ForEach-Object { "--add $_" })
)

$process = Start-Process -FilePath $installer -ArgumentList $bootstrapperArgumentList -Wait -PassThru

$exitCode = $process.ExitCode
Write-Host "returned" $exitCode

if ($exitCode -ne 0 -and $exitCode -ne 3010)
{
    Write-Host "installation failed"
    exit $exitCode
}

rm $installer, $channel

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop install python git --global

pip install --no-warn-script-location --upgrade pip
pip install --no-warn-script-location conan ninja
