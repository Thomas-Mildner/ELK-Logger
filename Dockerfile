FROM gradle:8-jdk21-alpine AS build
LABEL maintainer="Thomas Mildner"
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM eclipse-temurin:21-jre-alpine
EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/ELK_Example-0.0.1-SNAPSHOT.jar /app/elk-spring-boot-application.jar
ENTRYPOINT ["java", "-jar","/app/elk-spring-boot-application.jar"]