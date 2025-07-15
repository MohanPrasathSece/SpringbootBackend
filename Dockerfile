# -------- Build stage --------
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Package the application (skip tests)
RUN mvn clean package -DskipTests

# -------- Runtime stage --------
FROM eclipse-temurin:17-jre  # ← NOT alpine!
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
