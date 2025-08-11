# Use Maven image to build the jar
FROM maven:3.9.0-eclipse-temurin-17 AS build

WORKDIR /app

# Copy only the files needed for build
COPY pom.xml .
COPY src ./src

# Build jar skipping tests for faster build
RUN mvn clean package -DskipTests

# Use a lightweight JRE image to run the jar
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the jar from the previous build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
