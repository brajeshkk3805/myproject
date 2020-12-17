<<<<<<< HEAD
FROM node:7-onbuild
LABEL maintainer "brajeshkk@rssoftware.co.in"
HEALTHCHECK	--interval=5s \
            --timeout=5s \
CMD curl -f http://172.18.18.63:8000 || exit 1
EXPOSE 8000
=======
FROM openjdk:8u121-jdk-alpine
EXPOSE 8080
ADD target/SampleJava-0.0.1-SNAPSHOT.jar SampleJava-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/SampleJava-0.0.1-SNAPSHOT.jar"]
>>>>>>> 5f1aea619adfaaa3c5bd258047f661dbf584718f
