FROM alpine:3.22.1@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1

# Note: Tor is only in testing repo
RUN apk update && apk add \
    tor nyx \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    && rm -rf /var/cache/apk/*

# default port to used for incoming Tor connections
# can be changed by changing 'ORPort' in torrc
EXPOSE 9002

# copy in our torrc files
COPY torrc.middle /etc/tor/torrc.middle

# make sure files are owned by tor user
RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor", "-f", "/etc/tor/torrc.middle" ]