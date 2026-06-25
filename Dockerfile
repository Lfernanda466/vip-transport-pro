# Etapa 1: Construcción (Build)
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución (Runtime)
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
# Copiamos el archivo WAR generado
COPY --from=build /app/target/*.war app.war
EXPOSE 8082
# Comando para arrancar la aplicación
ENTRYPOINT ["java", "-jar", "app.war"]
