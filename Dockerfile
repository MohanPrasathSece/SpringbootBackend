# -------- Runtime stage --------
# Use non-alpine to avoid missing java in PATH
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
