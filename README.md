# groovy-devcontainer

A Groovy development container for Visual Studio Code.

## Motivation

The intention behind this project is to create a base development container that can be used in individual project repositories to setup an out-of-the-box development experience so that developers can get going quickly.

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) is installed and running
- [Docker Compose](https://docs.docker.com/compose/install/) is installed
- [Visual Studio Code](https://code.visualstudio.com/download) is installed
- [Visual Studio Code Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) is installed

## Features

- Access and manage Docker on the Host machine from within the dev container
- [Starship](https://starship.rs/) is installed as the default shell prompt
- [GitHub CLI](https://cli.github.com/) is installed

## Basic Usage

The easiest way to get started is to download the `/templates/.devcontainer` folder into your current project.

```sh
curl -L https://github.com/klein2ms/groovy-devcontainer/archive/master.tar.gz | tar -xz --strip=2 groovy-devcontainer-master/template/.devcontainer
```

The templates folder also contains a `launch.json` file which adds a nice <kbd>F5</kbd> keyboard shortcut to run django. You can grab the whole `.vscode` folder using the following.

```sh
curl -L https://github.com/klein2ms/groovy-devcontainer/archive/master.tar.gz | tar -xz --strip=2 groovy-devcontainer-master/template/.vscode
```

In VSCode, open the Command Palette <kbd>F1</kbd> and select __Remote-Containers: Reopen in Container__.

## Advanced Usage

The base devcontainer image accepts build arguments that can be set when building a derived image to extend the base image with additional packages and configurations.

This prevents the need of having to author additional code in the `Dockerfile` for a derived image. But, obviously that can be done as well.

### Install additional Debian packages

Add `DEBIAN_DEPS` with a list of space separated packages to the list of build arguments.

```yaml
# .devcontainer/docker-compose.yml
app:
    build:
        args:
            DEBIAN_DEPS: "nano tree"

```

### Install [nodejs](https://nodejs.org/en/) and [npm](https://www.npmjs.com/) packages

Add `NPM_DEPS` with a list of space separated packages to the list of build arguments.

```yaml
# .devcontainer/docker-compose.yml
app:
    build:
        args:
            NPM_DEPS: "yarn gulp"

```

## Prior Art and Acknowledgements

- This project is highly influenced by the [godevcontainer](https://github.com/qdm12/godevcontainer) created by @qdm12.

## License

This repository is under an [MIT license](License) unless otherwise indicated.
