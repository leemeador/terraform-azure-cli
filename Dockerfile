ARG PYTHON_VERSION="3.8.2"

FROM python:${PYTHON_VERSION}-alpine3.11

# Install Terraform
ENV TERRAFORM_VERSION 0.12.26

# Install APK Packages
RUN apk upgrade --update && \
    apk add --no-cache --update libstdc++ xvfb curl ca-certificates jq bash zip unzip openssl && \
    apk add --no-cache --virtual .build-deps gcc g++ make openssl-dev libffi-dev musl-dev linux-headers \
        libintl icu-libs libc6-compat gcompat python2 && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
    
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip -d /usr/bin terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    terraform version

# Install Azure CLI
ENV AZURE_CLI_VERSION 2.7.0

RUN pip install --upgrade pip && \
    pip install azure-cli==${AZURE_CLI_VERSION} && \
    az version
    
