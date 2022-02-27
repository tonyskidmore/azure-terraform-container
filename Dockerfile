ARG IMAGE_VERSION="latest"
ARG ALPINE_VERSION="3.15.0"

FROM alpine:${ALPINE_VERSION} as build

ARG TERRAFORM_VERSION="1.1.6"

RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin

FROM mcr.microsoft.com/azure-cli:${IMAGE_VERSION}

COPY --from=build ["/bin/terraform", "/bin/terraform"]
