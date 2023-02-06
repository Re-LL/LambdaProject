
FROM jenkins/jenkins:lts


USER root
RUN apt-get update && apt-get install -y curl libunwind8 gettext apt-transport-https


RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -


RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'


RUN apt-get update && apt-get install -y dotnet-sdk-3.1


USER jenkins