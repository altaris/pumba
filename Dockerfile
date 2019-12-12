FROM python:3

RUN apt update                                  && \
    apt upgrade -y                              && \
    apt install -y git python-virtualenv

ENV PATH /app:$PATH
COPY pumba /app/pumba

WORKDIR /usr/src/app

CMD pumba
