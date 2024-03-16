FROM python:3.10-slim

RUN apt update

RUN apt install python3-dev build-essential -y

RUN pip install --upgrade pip
RUN pip install virtualenv && python -m virtualenv /opt/venv

ENV PAtH='/opt/venv/bin:$PAtH'
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app

