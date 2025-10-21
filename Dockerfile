# Use a lightweight OpenJDK runtime
FROM openjdk:26-ea-17-trixie

# Set app directory
WORKDIR /app

# Copy JAR from target
COPY llc.jar app.jar

# Expose the port (matches SERVER_PORT)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]