# ==============================
# Stage 1: Build the Spring Boot app
# ==============================
FROM eclipse-temurin:17-jdk-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw pom.xml ./
COPY .mvn .mvn

# Download dependencies
RUN ./mvnw dependency:go-offline -B

# Copy the full project
COPY . .

# Build the JAR (skip tests for faster build)
RUN ./mvnw clean package -DskipTests

# ==============================
# Stage 2: Create runtime image
# ==============================
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the built JAR from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Use the port Render provides
ENV PORT=8080
EXPOSE $PORT

# Run the Spring Boot application with dynamic port
ENTRYPOINT ["java","-jar","/app/app.jar","--server.port=$PORT"]
