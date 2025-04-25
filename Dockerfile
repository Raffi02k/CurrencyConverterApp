
# Använd en officiell Java runtime som bas-image
FROM openjdk:24-jdk-slim as build

# Sätt arbetskatalogen i containern
WORKDIR /app

# Kopiera Maven/Gradle-filer först för att utnyttja Docker cache
COPY app/pom.xml ./
# Om du använder Gradle istället för Maven, använd dessa rader istället:
# COPY app/build.gradle app/settings.gradle ./
# COPY app/gradle ./gradle

# Kopiera källkoden
COPY app/src ./src

# Bygg applikationen
RUN ./mvnw package -DskipTests
# Om du använder Gradle:
# RUN ./gradlew build --no-daemon -x test

# Använd en mindre image för runtime
FROM openjdk:23-jre-slim

WORKDIR /app

# Kopiera den byggda JAR-filen från build-steget
COPY --from=build /app/target/*.jar app.jar

# Exponera porten som appen körs på
EXPOSE 8080

# Kör applikationen
ENTRYPOINT ["java", "-jar", "app.jar"]
