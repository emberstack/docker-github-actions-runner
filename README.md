# GitHub Self-Hosted Runner for Docker

[![Pipeline](
[GitHub Self-Hosted Runner for Docker](https://github.com/emberstack/docker-github-actions-runner) is self-hosted agent that you can run in a container with Docker.

[![Pipeline](https://github.com/emberstack/docker-github-actions-runner/actions/workflows/pipeline.yaml/badge.svg)](https://github.com/emberstack/docker-github-actions-runner/actions/workflows/pipeline.yaml)
[![Release](https://img.shields.io/github/release/emberstack/docker-github-actions-runner.svg?style=flat-square)](https://github.com/emberstack/docker-github-actions-runner/releases/latest)
[![Docker Image](https://img.shields.io/docker/image-size/emberstack/github-actions-runner/latest?style=flat-square)](https://hub.docker.com/r/emberstack/github-actions-runner)
[![Docker Pulls](https://img.shields.io/docker/pulls/emberstack/github-actions-runner.svg?style=flat-square)](https://hub.docker.com/r/emberstack/github-actions-runner)
[![license](https://img.shields.io/github/license/emberstack/docker-github-actions-runner.svg?style=flat-square)](LICENSE)

> Supports `amd64`, `arm` and `arm64`

## Runner Version

This image will automatically pull and install the latest runner version at startup.

### Support
If you need help or found a bug, please feel free to open an issue on the [emberstack/docker-github-actions-runner](https://github.com/emberstack/docker-github-actions-runner) GitHub project.  

## Deployment

The runner can be deployed in Docker using either `docker run` or `docker compose`.

#### Deployment in `docker`

```
docker run -d -e ORGANIZATION="<org name>" -e ACCESS_TOKEN="<access token>" -e REPO="<optional repo name>" emberstack/github-actions-runner
```
