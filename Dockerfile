FROM google/cloud-sdk:181.0.0-alpine

ENV GOOGLE_APPLICATION_CREDENTIALS /root/gcp-key.json

RUN set -ex; \
  apk add --no-cache docker; \
  docker --version; \
  gcloud --quiet components update; \
  gcloud --quiet components install gsutil kubectl beta