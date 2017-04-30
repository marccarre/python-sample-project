[![Build Status](https://travis-ci.org/marccarre/python-sample-project.svg?branch=master)](https://travis-ci.org/marccarre/python-sample-project)
[![Docker Pulls on Quay](https://quay.io/repository/marccarre/hello-python/status "Docker Repository on Quay")](https://quay.io/repository/marccarre/hello-python)
[![Docker Pulls on DockerHub](https://img.shields.io/docker/pulls/marccarre/hello-python.svg?maxAge=604800)](https://hub.docker.com/r/marccarre/hello-python/)

# python-sample-project
A cloud-native Python sample project leveraging containers for runtime.

### Pre-requisites

1. Install `docker`
2. Install `make`
3. Install `python3` & `pip`
4. Finally, run: `make init`. This will install [`pipenv`](http://docs.pipenv.org/en/latest/), create a virtual environment for Python, pull all dependencies required for this project in this environment, and enter it.


### Features

  - `pipenv`: the best of `pip` (Python dependencies management) & `virtualenv` (Python workspace isolation, no conflict between different versions of the same dependency);
  - `pytest`: better than `nose` these days & `nose2` isn't quite mature yet;
  - `pylint`: linting is particularly useful for a dynamically typed language like Python;
  - Dockerised: dependencies packaging, runtime isolation, cloud-native, etc.


### `Makefile`'s targets

- `setup`: set the project up;
- `init`: set the project up & enter the virtual environment;
- `test`: lint all sources, run all tests & gather test coverage metrics;
- `build`: package this project as a Docker container (required for `run` and `release` targets below);
- `run`: runs the Docker container containing this project, as it would in production;
- `release`: pushes the previously built Docker container to DockerHub and Quay.io;
- `clean`: delete all temporary files & containers for this project.
