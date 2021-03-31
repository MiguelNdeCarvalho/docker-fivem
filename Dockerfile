FROM alpine:3.13.4

ARG FIVEM_VER="2637-ddc2ad80888aa029858b89de09e76b0f1dd7ad8e"

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