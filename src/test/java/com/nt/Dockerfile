# Use JDK 21 for Spring Boot
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy Maven wrapper and project files
COPY . .

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the WAR (Spring Boot embedded Tomcat supports WAR too)
CMD ["java", "-jar", "target/QuotationGenerator-0.0.1-SNAPSHOT.war"]
