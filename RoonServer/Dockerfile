# ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base/amd64:4.1.4
# FROM ${BUILD_FROM}
ARG BUILD_FROM=hassioaddons/debian-base:4.2.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM} as base
ARG BUILD_ARCH

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG C.UTF-8
ENV ROON_SERVER_PKG RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL http://download.roonlabs.com/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data

# Install requirements for add-on
RUN apt-get update && apt-get -y upgrade && apt-get -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Matthijs" \
    org.label-schema.description="Roon Server" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Roon Serverr" \
    org.label-schema.schema-version="1.8" \
    org.label-schema.url="" \
    org.label-schema.usage="" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/matthijsberg/HomeAssistant-Addons" \
    org.label-schema.vendor="Matthijs HASSIO addons"
