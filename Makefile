IMAGE 				= pumba
PUMBA_TEST_VOLUME	= pumba-test
SUDO 				= sudo

all: build

build:
	$(SUDO) docker build -t $(IMAGE):$$(git rev-parse --abbrev-ref HEAD) .

clean:
	$(SUDO) docker volume rm $(PUMBA_TEST_VOLUME)

test: build
	-$(SUDO) docker volume create $(PUMBA_TEST_VOLUME)
	$(SUDO) docker run --rm												\
		--env "GIT_URL=https://github.com/altaris/python-asdf.git"		\
		--env "GIT_BRANCH=another-branch"								\
		--env "PYTHON_MAIN=src/main.py"									\
		--volume "$(PUMBA_TEST_VOLUME):/usr/src/app/"					\
		$(IMAGE):$$(git rev-parse --abbrev-ref HEAD)
