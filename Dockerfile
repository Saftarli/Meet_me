FROM python:3.10-slim

RUN apt update

RUN apt install python3-dev build-essential -y

ENV PYTHONDONTWRITEBYTECODE 1
ENV VIRTUAL-ENV=/opt/venv

RUN pip install --upgrade pip
RUN pip install virtualenv && python -m virtualenv $VIRTUAL-ENV

ENV PAtH='$VIRTUAL-ENV/bin:$PAtH'
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app

