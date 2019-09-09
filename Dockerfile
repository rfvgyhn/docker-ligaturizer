FROM python:3.7.4-alpine3.10

ARG FIRA_VERSION=2

RUN apk update
RUN apk add --no-cache --virtual build git wget unzip
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing fontforge

ENV PREFIX=
ENV OUTPUT_NAME=

WORKDIR /usr/local/src

RUN git clone --depth 1 https://github.com/ToxicFrog/Ligaturizer.git /usr/local/src
RUN mkdir -p fonts/fira/distr && \
    wget -O fira.zip https://github.com/tonsky/FiraCode/releases/download/${FIRA_VERSION}/FiraCode_${FIRA_VERSION}.zip && \
    unzip fira.zip 'otf/*' -d fonts/fira/distr && \
    rm fira.zip

RUN apk del build && \
    touch /input && \
    mkdir -p /output && \
    rm -rf input-fonts && \
    rm -rf output-fonts

COPY run.sh .
RUN chmod +x run.sh

VOLUME /output

CMD ["./run.sh"]
