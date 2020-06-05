FROM hashicorp/terraform

MAINTAINER Lee Meador <lee.meador@aa.com>
LABEL maintainer="lee.meador@aa.com"

RUN apt-get update
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg software-properties-common lsb-release

# prepare to install azure cli
# inspired by https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azure-cli.list

RUN apt-get update
RUN apt-get -y install azure-cli
