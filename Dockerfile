FROM maven:3.6.3 AS maven
MAINTAINER Sarbesh Kumar Sarkar <sarbeshsarkarsks@gmail.com>
WORKDIR /app
COPY . /app
EXPOSE 8888
RUN mvn clean package -DskipTests
ARG JAR_FILE=target/*.jar
ENTRYPOINT ["mvn", "spring-boot:run"]
#FROM openjdk:8-jdk-alpine as java
#
#COPY --from=maven ${JAR_FILE} app.jar
#
#ENTRYPOINT ["JAVA", "-jar", "app.jar"]