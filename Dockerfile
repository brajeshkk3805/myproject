FROM openjdk:8u121-jdk-alpine
EXPOSE 8080
ADD target/SampleJava-0.0.1-SNAPSHOT.jar SampleJava-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/SampleJava-0.0.1-SNAPSHOT.jar"]
