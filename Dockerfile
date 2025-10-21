# Base image containing dependencies used in builder and final image
FROM ghcr.io/swissgrc/azure-pipelines-node:22.21.0-net9 AS base

# Final image
FROM base AS final

LABEL org.opencontainers.image.vendor="Swiss GRC AG"
LABEL org.opencontainers.image.authors="Swiss GRC AG <opensource@swissgrc.com>"
LABEL org.opencontainers.image.title="azure-pipelines-playwright"
LABEL org.opencontainers.image.documentation="https://github.com/swissgrc/docker-azure-pipelines-playwright"

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /

# Install Playwright

# renovate: datasource=github-tags depName=microsoft/playwright extractVersion=^v(?<version>.*)$
ENV PLAYWRIGHT_VERSION=1.56.1

# Install Playwright browsers to a custom path to avoid permission issues
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

RUN npm install -g --ignore-scripts playwright@${PLAYWRIGHT_VERSION} && \
  # Install browsers with dependencies
  mkdir /ms-playwright && \
  playwright install --with-deps && \
  chmod -R 777 /ms-playwright && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  npm cache clean --force && \
  # Smoke test
  playwright install --list
