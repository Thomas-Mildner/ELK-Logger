FROM gradle:7-jdk-alpine AS build
MAINTAINER Thomas Mildner
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:17-alpine
EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/ELK_Example-0.0.1-SNAPSHOT.jar /app/elk-spring-boot-application.jar
ENTRYPOINT ["java", "-jar","/app/elk-spring-boot-application.jar"]