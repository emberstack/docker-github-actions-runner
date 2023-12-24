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
docker run -d -e ACCESS_TOKEN="<access token>" -e ORGANIZATION="<org name>" -e REPO="<optional repo name>" emberstack/github-actions-runner
```

> See [Managing your personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) to understand how to get an access token. 

You can customize the values of the deployment by using the following environment variables:

| Environment Variable          | Description                                                                                       | Required                                                 |
|-------------------------------|---------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| `ACCESS_TOKEN`                | The access token (PAT - Personal Access token) used to register the runner                        | Required                                                 |
| `ORGANIZATION`                | The owner or organization                                                                         | Required                                                 |
| `REPO`                        | The repository on which to register the runner                                                    | Optional - Registers to the org. if not specified        |
| `LABELS`                      | Comma separated list of labels to apply to the runner                                             | Optional                                                 |
| `NAME`                        | Runner name                                                                                       | Optional - Defaults to the hostname if not specified     |