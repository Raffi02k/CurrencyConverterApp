# Använd en officiell Java runtime som bas-image
FROM maven:3-eclipse-temurin-24 as build

# Sätt arbetskatalogen i containern
WORKDIR /app

# Kopiera källkoden
COPY . .

# Bygg applikationen
RUN ./mvnw package -DskipTests

# Använd en mindre image för runtime - VIKTIGT: Använd Java 24 istället för Java 17
FROM eclipse-temurin:24-jre

WORKDIR /app

# Kopiera den byggda JAR-filen från build-steget
COPY --from=build /app/app/target/*.jar app.jar
COPY --from=build /app/api/target/*.jar api.jar
COPY --from=build /app/impl-bitcoin/target/*.jar bitcoin.jar
COPY --from=build /app/impl-eur/target/*.jar eur.jar
COPY --from=build /app/impl-usd/target/*.jar usd.jar

# Exponera porten som appen körs på
EXPOSE 8080

# Kör applikationen med den identifierade huvudklassen
ENTRYPOINT ["java", "-cp", "app.jar:api.jar:bitcoin.jar:eur.jar:usd.jar", "se.iths.java24.Main"]
