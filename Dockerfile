FROM node:7-onbuild
LABEL maintainer "brajeshkk@rssoftware.co.in"
HEALTHCHECK	--interval=5s \
            --timeout=5s \
CMD curl -f http://172.18.18.63:8000 || exit 1
EXPOSE 8000