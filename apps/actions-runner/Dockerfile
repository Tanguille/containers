ARG VERSION
FROM ghcr.io/actions/actions-runner:${VERSION}
ARG TARGETARCH

ENV DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND="noninteractive" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

RUN \
    apt-get -qq update \
    && \
    apt-get -qq install -y --no-install-recommends --no-install-suggests \
    clang \
    lld \
    ca-certificates \
    gcc \
    jo \
    moreutils \
    git \
    libpq-dev \
    libssl-dev \
    sshpass \
    build-essential \
    make \
    pkg-config \
    wget \
    zstd \
    && curl -fsSL "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_${TARGETARCH}" -o /usr/local/bin/yq \
    && chmod +x /usr/local/bin/yq \
    && rm -rf /var/lib/apt/lists/*

USER runner