# -------- Build stage --------
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Package the application (skip unit tests that need a live DB)
RUN mvn clean package -DskipTests

# -------- Runtime stage --------
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy the built JAR from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/mohan-app-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Command to run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
