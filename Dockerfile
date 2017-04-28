FROM alpine:3.5

ENV LANG=en_US.UTF-8
ENV TIME_ZONE=Asia/Shanghai

# install requirements
COPY requirements.txt *.sh *.py /app/

WORKDIR /app
RUN set -ex && \
    addgroup -g 1000 wsgi && \
    adduser -u 1000 -G wsgi -s /bin/sh -H -D wsgi && \
    echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories && \
    echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >> /etc/apk/repositories

RUN apk add --no-cache --update ca-certificates build-base linux-headers musl-dev tini && \
    apk add --no-cache --update tzdata vim python3 py3-pip pcre-dev python3-dev libffi g++ gcc gfortran openblas-dev && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h

RUN pip3 install --upgrade pip

RUN pip3 install --no-cache-dir -i https://pypi.doubanio.com/simple --extra-index-url https://pypi.gizwits.com:1443/root/gizwits -r requirements.txt