#
# Nginx with auto-reload feature
#
# @see https://github.com/kubernetes/examples/tree/master/staging/https-nginx
# @see https://8gwifi.org/docs/kube-nginx.jsp
#

FROM nginx:1.14.2

COPY auto-reload-nginx.sh  /usr/local/bin/auto-reload-nginx.sh

RUN apt-get update  && \
    \
    echo "==> Install inotify..."  && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y inotify-tools  && \
    \
    \
    echo "==> Clean up..."       && \
    apt-get clean                && \
    rm -rf /var/lib/apt/lists/*  && \
    \
    \
    chmod +x /usr/local/bin/auto-reload-nginx.sh