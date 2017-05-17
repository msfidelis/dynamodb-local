# dynamodb-local
Docker Image for run DynamoDB Locally on Dev/Test Env with Docker

> Docs Reference: https://aws.amazon.com/pt/documentation/dynamodb/
 

## Running on Docker

```bash
$ docker pull msfidelis/dynamodb
```

#### Docker Compose example
```yml
version: "3"

services:
  dynamodb:
    build: .
    volumes:
      - ./database:/database
    ports:
      - "8000:8000"
```

You can persist DynamoDB Data mapping a volume in /database inside container

## Configure AWS CLI - Local 

>Region is required 

```
$ aws configure 
```

### List tables 
```
aws dynamodb list-tables --endpoint-url http://localhost:8000
```

### Create a default table 

```
$ aws dynamodb create-table \
    --table-name Music \
    --attribute-definitions \
        AttributeName=Artist,AttributeType=S \
        AttributeName=SongTitle,AttributeType=S \
    --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
    --endpoint-url http://localhost:8000
```

#### Reponse

```json
{
    "TableDescription": {
        "TableArn": "arn:aws:dynamodb:ddblocal:000000000000:table/Music",
        "AttributeDefinitions": [
            {
                "AttributeName": "Artist",
                "AttributeType": "S"
            },
            {
                "AttributeName": "SongTitle",
                "AttributeType": "S"
            }
        ],
        "ProvisionedThroughput": {
            "NumberOfDecreasesToday": 0,
            "WriteCapacityUnits": 1,
            "LastIncreaseDateTime": 0.0,
            "ReadCapacityUnits": 1,
            "LastDecreaseDateTime": 0.0
        },
        "TableSizeBytes": 0,
        "TableName": "Music",
        "TableStatus": "ACTIVE",
        "KeySchema": [
            {
                "KeyType": "HASH",
                "AttributeName": "Artist"
            },
            {
                "KeyType": "RANGE",
                "AttributeName": "SongTitle"
            }
        ],
        "ItemCount": 0,
        "CreationDateTime": 1494978347.819
    }
}
```
