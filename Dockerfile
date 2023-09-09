FROM openjdk:8-alpine

COPY target/uberjar/demo-app.jar /demo-app/app.jar

EXPOSE 3000

CMD ["java", "-jar", "/demo-app/app.jar"]
