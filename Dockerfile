# syntax=docker/dockerfile:1

FROM openjdk:16-alpine3.13

WORKDIR /app

RUN apk add --no-cache maven
COPY pom.xml ./

# RUN dos2unix mvnw
RUN mvnw dependency:go-offline
# RUN chmod +x mvnw
# RUN pwd && ls -la
# RUN mvnw clean install
# RUN /bin/sh -c "mvnw dependency:go-offline"

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]