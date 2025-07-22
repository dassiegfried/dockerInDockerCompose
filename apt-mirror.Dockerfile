# Building apt-mirror from sources

FROM debian:stable-slim@sha256:377ddc2a20fe8632a49b69dcfff10fccbd5b4f0b8c2d593420a6a5e03070dfa1

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
