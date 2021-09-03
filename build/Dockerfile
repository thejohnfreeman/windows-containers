ARG version=20H2
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-${version}
COPY install.ps1 .
RUN powershell .\install.ps1 && del install.ps1
COPY Profile.ps1 C:\Windows\System32\WindowsPowerShell\v1.0
USER ContainerUser
ENTRYPOINT ["cmd.exe", "/S", "/C", "C:\\BuildTools\\VC\\Auxiliary\\Build\\vcvars64.bat", "&&"]
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
