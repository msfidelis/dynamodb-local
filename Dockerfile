#FROM openjdk:8u121-jdk-alpine
FROM openjdk:8u131-jdk
MAINTAINER Matheus Fidelis <msfidelis01@gmail.com>
RUN mkdir -p /database

COPY dynamodb /dynamodb
WORKDIR /dynamodb

ENV DBPORT=8000

EXPOSE 8000

CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbPath", "/database"]

