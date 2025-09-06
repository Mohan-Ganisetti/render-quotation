# Use JDK 17 for Spring Boot
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy Maven wrapper and project files
COPY . .

# Ensure mvnw is executable and build the app
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the WAR
CMD ["java", "-jar", "target/QuotationGenerator-0.0.1-SNAPSHOT.war"]
