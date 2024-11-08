ARG IMAGE_CACHE_PREFIX=paymentology.jfrog.io/pt-docker-virtual-thirdparty
ARG ALPINE_VERSION=3.15
FROM ${IMAGE_CACHE_PREFIX}/alpine:${ALPINE_VERSION}

RUN apk add --no-cache bash curl jq wget
RUN mkdir -p "$HOME/bin" && \
    cd "$HOME/bin" && \
    wget https://github.com/denisidoro/docpars/releases/download/v0.2.0/docpars-v0.2.0-x86_64-unknown-linux-musl.tar.gz && tar xvfz docpars-v0.2.0-x86_64-unknown-linux-musl.tar.gz -C ./ && \
    chmod +x docpars

ADD entrypoint.sh /entrypoint.sh
ADD src /src

ENTRYPOINT ["/entrypoint.sh"]
