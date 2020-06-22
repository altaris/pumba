pumba
=====

Had no idea what to call it. It's just a docker image with python and git.
Pulls latest version of your python codebase from a git repository, installs
dependencies, run.

# Environment variables

* `GIT_URL`: The url of the git repository.
* `GIT_BRANCH` (default `master`): Branch to pull.
* `PYTHON_MAIN` (default `main.py`): Main python file.
* `PYTHON_MAIN_MODULE`: Module to run with `python3 -m <module>`, mutually
  exclusive with `PYTHON_MAIN`.
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