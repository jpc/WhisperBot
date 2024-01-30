FROM ghcr.io/collabora/whisperfusion-base:latest as base
ARG S6_OVERLAY_VERSION=3.1.6.2

RUN apt-get update && apt-get install -y nginx xz-utils

WORKDIR /root
COPY scripts/setup-whisperfusion.sh scripts/run-whisperfusion.sh scratch-space/models /root/
RUN ./setup-whisperfusion.sh

COPY nginx-run /etc/services.d/nginx/run

CMD ./run-whisperfusion.sh

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
ENTRYPOINT ["/init"]
