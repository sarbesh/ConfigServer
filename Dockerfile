FROM maven:3.6.3 AS maven
MAINTAINER Sarbesh Kumar Sarkar <sarbeshsarkarsks@gmail.com>
WORKDIR /app
COPY . /app

RUN mvn clean package
ARG JAR_FILE=target/*.jar

FROM openjdk:8-jdk-alpine as java

COPY --from=maven ${JAR_FILE} app.jar
EXPOSE 8888
ENTRYPOINT ["JAVA", "-jar", "app.jar"]