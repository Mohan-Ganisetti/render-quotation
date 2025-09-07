# Use official OpenJDK 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build JAR using Maven (use Maven image temporarily)
RUN apk add --no-cache maven git bash && mvn clean package -DskipTests

# Copy the built JAR
COPY target/QuotationGenerator-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
