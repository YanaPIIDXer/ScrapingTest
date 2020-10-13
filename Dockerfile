FROM python:3.7-alpine

ENV PYTHONIOENCODING utf-8
RUN apk add --update chromium chromium-chromedriver
RUN pip install selenium

WORKDIR /app

# 日本語フォントのインストール
# 参考：https://hodalog.com/use-selenium-on-docker/
RUN mkdir noto \
    && wget -P /app/noto https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    && unzip /app/noto/NotoSansCJKjp-hinted.zip -d /app/noto \
    && mkdir -p /usr/share/fonts/noto \
    && cp /app/noto/*.otf /usr/share/fonts/noto \
    && chmod 644 -R /usr/share/fonts/noto/ \
    && fc-cache -fv \
    && rm -rf /app/noto

ADD ./src /app
