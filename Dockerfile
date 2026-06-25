# Etapa 1: Construcción
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# Forzamos la creación del archivo
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
# USAMOS UN COMODÍN (*) PARA QUE ENCUENTRE EL ARCHIVO SEA CUAL SEA EL NOMBRE
COPY --from=build /app/target/*.war app.war
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "app.war"]
