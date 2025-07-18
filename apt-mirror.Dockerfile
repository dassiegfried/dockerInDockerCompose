# Building apt-mirror from sources

FROM debian:stable-slim@sha256:7e0b7fe7c6d695d615eabaea8d19adf592a6a9ff3dbd5206d3e31139b9afdfa7

RUN apt update
RUN apt install bzip2 gcc make perl wget rsync xz-utils --no-install-recommends -y

WORKDIR /apt-mirror
COPY ./apt-mirror-source-files/apt-mirror /apt-mirror
COPY ./apt-mirror-source-files/.perltidyrc /apt-mirror
COPY ./apt-mirror-source-files/Makefile /apt-mirror
COPY ./apt-mirror-source-files/mirror.list /apt-mirror
COPY ./apt-mirror-source-files/postmirror.sh /apt-mirror

RUN make
RUN make install
