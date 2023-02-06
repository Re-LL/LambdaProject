# Utilisez l'image officielle de Jenkins comme base
FROM jenkins/jenkins:lts

# Installez les dépendances nécessaires pour .NET
USER root
RUN apt-get update && apt-get install -y curl libunwind8 gettext apt-transport-https && rm -rf /var/lib/apt/lists/*

# Installez .NET SDK
RUN curl -SL --output dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/5.0.100/dotnet-sdk-5.0.100-linux-x64.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# Configurez le port pour Jenkins
EXPOSE 8080

# Lancez Jenkins avec l'interface d'écoute sur 0.0.0.0
CMD ["/usr/local/bin/jenkins.sh", "--httpListenAddress=0.0.0.0"]