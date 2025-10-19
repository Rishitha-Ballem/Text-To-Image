FROM openjdk:17
COPY target/demo.jar /app/demo.jar
WORKDIR /app
CMD ["java", "-jar", "demo.jar"]
