FROM wordpress:6.8.2-fpm-alpine@sha256:40dcd57f9b12fae9a641a448426dbc6382f2dc77e0ddb4a1c9049c610745360b

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions gmp