#!/bin/bash

SERVICE_NAME=$1
PROJECT_ID=$2
REGION=$3
ARTIFACT_REPOSITORY_IMAGE_NAME=$4
SHORT_SHA=$5

gcloud run deploy $SERVICE_NAME \
  --quiet \
  --platform=managed \
  --project=$PROJECT_ID \
  --region=$REGION \
  --image=$ARTIFACT_REPOSITORY_IMAGE_NAME:$SHORT_SHA \
  --no-use-http2 \
  --update-secrets=MYSQL_USER=MYSQL_USER:latest