FROM python:3.7-alpine

ENV PYTHONIOENCODING utf-8
RUN apk add --update chromium chromium-chromedriver

WORKDIR /app

ADD ./src /app
