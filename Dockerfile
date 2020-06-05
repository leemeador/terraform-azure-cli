FROM hashicorp/terraform:0.12.26

MAINTAINER Lee Meador <lee.meador@aa.com>
LABEL maintainer="lee.meador@aa.com"

# Add Azure CLI to the image
RUN \
  apk update && \
  apk add bash py-pip && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
  pip --no-cache-dir install -U pip && \
  pip --no-cache-dir install azure-cli && \
  apk del --purge build
  
