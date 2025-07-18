FROM wordpress:6.8.2-fpm-alpine@sha256:f2e10ae305ae76c277742611e9005bf85e26b2adda2adf59b3bade0d7ae5b984

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions gmp