ARG IMAGE_VERSION="latest"

FROM mcr.microsoft.com/azure-cli:${IMAGE_VERSION}

ARG TERRAFORM_VERSION="1.1.6"
ARG USERNAME="terraform"
ARG CAF_MODULE_VERSION="5.4.8"

RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mkdir -p /terraform/modules/terraform-azurerm-caf && \
    git clone --depth=1 --branch "$CAF_MODULE_VERSION" https://github.com/aztfmod/terraform-azurerm-caf.git /terraform/modules/terraform-azurerm-caf && \
    rm -rf /terraform/modules/terraform-azurerm-caf/.git

WORKDIR /terraform

