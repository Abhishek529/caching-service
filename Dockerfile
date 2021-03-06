FROM ubuntu:16.04

MAINTAINER Ashok Shingade "ashok.devops@devops.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENV FLASK_APP=server.py

ENTRYPOINT [ "flask" ]

CMD [ "run", "-h", "0.0.0.0" ]
