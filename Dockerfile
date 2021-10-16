FROM ghcr.io/linuxserver/baseimage-alpine:3.12

# set version label
ARG BUILD_DATE
ARG VERSION
ARG TARGETARCH
ARG PACKAGE
LABEL build_version="${PACKAGE} version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="docker-geph"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
  curl && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
  iptables \
  inotify-tools && \
 echo "**** install ${PACKAGE} ****" && \
 curl -o \
  /tmp/${PACKAGE} -L \
  "https://github.com/docker-geph/${PACKAGE}/releases/download/${VERSION}/${PACKAGE}-${TARGETARCH}" && \
 install -Dm755 /tmp/${PACKAGE} /usr/bin/ && \
 echo "**** cleanup ****" && \
 apk del --purge \
  build-dependencies && \
 rm -rf \
  /tmp/*

# copy local files
COPY root/ /

# ports and volumes
VOLUME /config
