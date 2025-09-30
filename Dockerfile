FROM eclipse-temurin:21-jdk AS build
LABEL maintainer="Thomas Mildner"
COPY --chown=1000:1000 . /home/app/src
WORKDIR /home/app/src
RUN chmod +x gradlew && ./gradlew build --no-daemon

FROM eclipse-temurin:21-jre
EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/app/src/build/libs/ELK_Example-0.0.1-SNAPSHOT.jar /app/elk-spring-boot-application.jar
ENTRYPOINT ["java", "-jar","/app/elk-spring-boot-application.jar"]