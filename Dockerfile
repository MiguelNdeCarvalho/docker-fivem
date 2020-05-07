FROM alpine:3.11.6

ARG FIVEM_VER="2445-618f12641672275983a0d84c087d50a32ab7fefc/"

ENV PORT="30120"
ENV RCON="securercon"
ENV LICENSE_KEY="changeme"
ENV UID=0
ENV GID=0

LABEL maintainer = "MiguelNdeCarvalho <geral@miguelndecarvalho.pt>" \
      description = "FiveM Server based on Alpine" \
      url = "https://github.com/MiguelNdeCarvalho/docker-fivem" \
      version = "${FIVEM_VER}"

RUN apk upgrade --no-cache \
    && apk add --no-cache \
    git  \
    shadow && \
    adduser --disabled-password --home /fivem fivem && \
    chown -R fivem /fivem

COPY rootfs /

RUN /bin/sh /setup.sh

CMD ["./start.sh"]

EXPOSE 30120 40120