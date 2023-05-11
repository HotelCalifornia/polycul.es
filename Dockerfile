FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    libffi-dev

RUN pip3 install uwsgi

WORKDIR /polycul.es

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY entrypoint.sh entrypoint.sh
RUN chmod +x ./entrypoint.sh

COPY ./migrations/*.sql ./migrations/
COPY ./migrations/*.py ./migrations/
COPY ./static/*.js ./static/
COPY ./static/*.css ./static/
COPY ./templates/*.jinja2 ./templates/
COPY ./*.py ./


ENTRYPOINT [ "/bin/sh", "/polycul.es/entrypoint.sh" ]