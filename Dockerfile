FROM openjdk:8u121-jdk-alpine
MAINTAINER Matheus Fidelis <msfidelis01@gmail.com>

COPY dynamodb /dynamodb
WORKDIR /dynamodb

EXPOSE 8000

CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]

