pumba
=====

Had no idea what to call it. It's just a docker image with python and git.
Pulls latest version of your python codebase from a git repository, installs
dependencies, run.

# Environment variables

* `GIT_URL`: The url of the git repository
* `GIT_BRANCH` (default `master`): Branch to pull
* `PYTHON_MAIN` (default `main.py`): Main python file
* `PIP_REQUIREMENTS_FILE` (default `requirements.txt`): Requirement file for
  pip
