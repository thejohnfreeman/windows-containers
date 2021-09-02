FROM mcr.microsoft.com/windows/nanoserver:20H2-amd64
USER ContainerAdministrator
COPY install.bat .
RUN install.bat && del install.bat
USER ContainerUser
CMD ["C:\\Windows\\System32\\pwsh.exe"]
