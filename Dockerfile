FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Install bash in case mvnw requires it on Alpine
RUN apk add --no-cache bash

COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY src ./src

RUN chmod +x mvnw && ./mvnw package -DskipTests

CMD ["java", "-jar", "target/aulabd-0.0.1-SNAPSHOT.jar"]