FROM alpine:3.11.5

ARG FIVEM_VER="2397-d16cd9e2a657f0e72943ac23b8415e8984fb80df"

LABEL maintainer = "MiguelNdeCarvalho <geral@miguelndecarvalho.pt>" \
      description = "FiveM Server based on Alpine" \
      url = "https://github.com/MiguelNdeCarvalho/docker-fivem" \
      version = "${FIVEM_VER}"

RUN apk upgrade --no-cache \
    && apk add --no-cache \
    git

COPY rootfs /

RUN /bin/sh /setup.sh

CMD ["./start.sh"]

EXPOSE 30120 40120