FROM alpine:3.2

RUN apk-install docker bash \
    && curl -sL https://get.docker.com/builds/Linux/x86_64/docker-1.8.1 > /usr/bin/docker \
    && chmod +x /usr/bin/docker \
    && curl -sL https://github.com/docker/docker/raw/master/hack/dind > /usr/local/bin/dind \
    && chmod +x /usr/local/bin/dind

VOLUME /var/lib/docker
CMD ["dind", "docker", "daemon"]