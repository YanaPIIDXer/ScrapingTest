FROM python:3.7-alpine

ENV PYTHONIOENCODING utf-8
RUN apk add --update chromium chromium-chromedriver
RUN pip install selenium

WORKDIR /app

ADD ./src /app
