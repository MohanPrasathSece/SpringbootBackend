# -------- Build stage --------
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

<<<<<<< HEAD
# Package the application (skip tests)
=======
>>>>>>> e424ee2aadf277823959abfc5bcd6b612bd11a81
RUN mvn clean package -DskipTests

# -------- Runtime stage --------
FROM eclipse-temurin:17-jre
WORKDIR /app

<<<<<<< HEAD
# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Render will provide PORT env variable
ENV PORT=8080

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java -jar app.jar --server.port=$PORT"]
=======
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
>>>>>>> e424ee2aadf277823959abfc5bcd6b612bd11a81
