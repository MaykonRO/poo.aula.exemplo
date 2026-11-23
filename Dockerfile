FROM eclipse-temurin:21-jdk

WORKDIR /app 

COPY pom.xml .
COPY src ./src 
COPY pom.xml .
COPY .mvn .mvn 

RUN chmod 777 mvnw 

RUN ./mvnw package

CMD ["java","-jar","target/aulabd-0.0.1-SNAPSHOT.jar"]