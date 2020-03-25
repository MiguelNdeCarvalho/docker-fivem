FROM alpine:3.11.5

LABEL maintainer = "MiguelNdeCarvalho <geral@miguelndecarvalho.pt>" \
      description = "FiveM + TXAdmin based on Alpine"

RUN apk -U add \
    git \
    nodejs \
    npm && \
    cd / && \
    git clone https://github.com/tabarra/txAdmin panel && \
    cd /panel

COPY rootfs /

RUN /bin/sh /setup.sh

CMD ["./start.sh"]

EXPOSE 40120