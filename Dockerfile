FROM python:2.7.15-alpine3.6

RUN apk update
RUN apk add --update --no-cache git
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing fontforge

ENV PREFIX=ligaturized
WORKDIR /usr/local/src

RUN git clone https://github.com/ToxicFrog/Ligaturizer.git /usr/local/src
RUN apk del git && \
    rm /var/cache/apk/* && \
    mkdir -p /input /output && \
    rm -rf input-fonts && \
    rm -rf output-fonts

COPY run.sh .
RUN chmod +x run.sh

VOLUME /input /output

CMD ["./run.sh"]
