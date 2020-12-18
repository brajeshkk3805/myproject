FROM alpine
RUN apk add docker
RUN adduser -D jenkins
USER jenkins