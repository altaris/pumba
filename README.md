pumba
=====

[![Docker Build Status](https://img.shields.io/docker/cloud/build/altaris/pumba)](https://hub.docker.com/r/altaris/pumba/)
[![MIT License](https://badgen.net/badge/license/MIT/blue)](https://choosealicense.com/licenses/mit/)

Had no idea what to call it. It's just a docker image with python and git.
Pulls latest version of your python codebase from a git repository, installs
dependencies, run.

# Environment variables

* `COMMAND`: Command to run (after activation of virtualenv); mutually
  exclusive with `PYTHON_MAIN` and `PYTHON_MAIN_MODULE`.
* `GIT_URL`: The url of the git repository.
* `GIT_BRANCH` (default `master`): Branch to pull.
* `PYTHON_MAIN` (default `main.py`): Main python file; mutually exclusive with
  `PYTHON_MAIN_MODULE` and `COMMAND`.
* `PYTHON_MAIN_MODULE`: Module to run with `python3 -m <module>`; mutually
  exclusive with `PYTHON_MAIN` and `COMMAND`.
* `PIP_REQUIREMENTS_FILE` (default `requirements.txt`): Requirement file for
  pip.

# Examples

```sh
docker volume create pumba-test-volume
docker run --rm                                                         \
    --env "GIT_URL=https://username:password@github.com/user/repo.git"  \
    --env "GIT_BRANCH=release"                                          \
    --env "PYTHON_MAIN=src/main.py"                                     \
    --volume "pumba-test-volume:/usr/src/app/"                          \
    altaris/pumba
```

```sh
docker volume create pumba-test-volume
docker run --rm                                                         \
    --env "GIT_URL=https://username:password@github.com/user/repo.git"  \
    --env "GIT_BRANCH=release"                                          \
    --env "PYTHON_MAIN_MODULE=amodule"                                  \
    --volume "pumba-test-volume:/usr/src/app/"                          \
    altaris/pumba
```

```sh
docker volume create pumba-test-volume
docker run --rm                                                              \
    --env "GIT_URL=https://username:password@github.com/user/repo.git"       \
    --env "GIT_BRANCH=release"                                               \
    --env "COMMAND=python3 manage.py migrate && python3 manage.py runserver" \
    --volume "pumba-test-volume:/usr/src/app/"                               \
    altaris/pumba
```