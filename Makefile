IMAGE 	= pumba
SUDO 	= sudo

all: build

build:
	$(SUDO) docker build -t $(IMAGE):$$(git rev-parse --abbrev-ref HEAD) .

test: build
	$(SUDO) docker run --rm												\
		--env "GIT_URL=https://github.com/altaris/python-asdf.git"		\
		--env "GIT_BRANCH=master"										\
		--env "PYTHON_MAIN=src/main.py"									\
		$(IMAGE):$$(git rev-parse --abbrev-ref HEAD)