# Google Cloud SDK

[Google Cloud SDK][gcpsdk] bundled with [Kubernetes CLI][kube] (`kubectl`).


### Supported tags and respective `Dockerfile` links

* `181.0.0`, `181.0`, `181`, `latest` *[(Dockerfile)](https://github.com/kriasoft/docker-gcloud/blob/master/Dockerfile)*


### Usage Example

To use this image, pull it from [Docker Hub][hub] by running:

```bash
docker pull kriasoft/gcloud:latest
```

Verify the image:

```bash
docker run -it kriasoft/gcloud:latest gcloud version
docker run -it kriasoft/gcloud:latest kubectl version
```

or, user a particular version number:

```bash
docker run -it kriasoft/gcloud:181.0.0 gcloud version
docker run -it kriasoft/gcloud:181.0.0 kubectl version
```

Then, authenticate by running:

```bash
docker run -it \
  --volume "$PWD/gcp-key.json:/root/gcp-key.json"
  --name gcloud-config \
  kriasoft/gcloud:latest \
  sh -c '
    gcloud auth activate-service-account --key-file /root/gcp-key.json
    gcloud --quiet config configurations activate $PROJECT || gcloud config configurations create $PROJECT --activate
    gcloud --quiet config set project $PROJECT
    gcloud --quiet config set compute/region europe-west1
    gcloud --quiet config set compute/zone europe-west1-b
  '
```

To list compute instances using these credentials, run the container with:

```bash
docker run --rm -it \
  --volumes-from gcloud-config \
  kriasoft/gcloud \
  gcloud compute instances list --project <your-project>
```


### Related projects

* [Node.js API Starter Kit](https://github.com/kriasoft/nodejs-api-starter)
* [React Starter Kit](https://github.com/kriasoft/react-starter-kit)
* [React Static Boilerpolate](https://github.com/kriasoft/react-static-boilerplate)

[gcpsdk]: https://cloud.google.com/sdk/docs/
[kube]: https://kubernetes.io/
[hub]: https://hub.docker.com/r/kriasoft/gcloud