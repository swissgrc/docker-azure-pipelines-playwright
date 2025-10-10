# Docker image for running Playwright in an Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-playwright/blob/main/LICENSE) [![Build](https://img.shields.io/github/actions/workflow/status/swissgrc/docker-azure-pipelines-playwright/publish.yml?branch=develop&style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-playwright/actions/workflows/publish.yml) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=swissgrc_docker-azure-pipelines-playwright&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=swissgrc_docker-azure-pipelines-playwright) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-playwright.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-playwright) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-playwright.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-playwright)
<!-- markdownlint-restore -->

🐳 Docker image to run Playwright in [Azure Pipelines container jobs].

## Usage

This image can be used to run Playwright in [Azure Pipelines container jobs].

### Azure Pipelines Container Job

To use the image in an Azure Pipelines Container Job, add one of the following example tasks and use it with the `container` property.

The following example shows the container used in a build step:

```yaml
  - stage: Build
    jobs:
      - job: Test
        container: swissgrc/azure-pipelines-playwright:latest
        steps:
          - bash: |
              playwright --version 
```

## Included Software

- [swissgrc/azure-pipelines-node:22-net9](https://github.com/swissgrc/docker-azure-pipelines-node22-net9) as base image
- Playwright
- Playwright browsers with dependencies

## Tags

| Tag      | Description                                               | Size                                                                                                                               |
|----------|-----------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| latest   | Latest stable release (from `main` branch)                | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-playwright/latest?style=flat-square)   |
| unstable | Latest unstable release (from `develop` branch)           | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-playwright/unstable?style=flat-square) |
| x.y.z    | Image for a specific version of playwright                 |                                                                                                                                    |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
