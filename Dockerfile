# --- Stage 1: Build the JAR ---
# We use a 'maven' image here because it has Java + Maven pre-installed
FROM maven:3.9-eclipse-temurin-21-alpine AS build
WORKDIR /app

# 1. Copy pom.xml and download dependencies (this leverages Docker layer caching)
COPY pom.xml .
RUN mvn dependency:go-offline

# 2. Copy source code and build the application
COPY src ./src
RUN mvn clean package -DskipTests

# --- Stage 2: Create the Runtime Image ---
# We use the lighter JDK (or JRE) image here just to run the app
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app

# 3. Copy the built JAR from the 'build' stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 9000
ENTRYPOINT ["java", "-jar", "app.jar"]