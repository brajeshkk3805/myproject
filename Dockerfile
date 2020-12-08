FROM openjdk:8u121-jdk-alpine
ENV http_proxy http://172.25.8.17:8080
ENV https_proxy https://172.25.8.17:8080
EXPOSE 8080
ADD target/SampleJava-0.0.1-SNAPSHOT.jar SampleJava-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/SampleJava-0.0.1-SNAPSHOT.jar"]
