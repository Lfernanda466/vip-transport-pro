# Etapa 1: Construcción
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
# Copiamos el archivo que Maven llamó "app.war" gracias al paso anterior
COPY --from=build /app/target/app.war app.war
EXPOSE 8082
# Comando de arranque
ENTRYPOINT ["java", "-jar", "app.war"]
