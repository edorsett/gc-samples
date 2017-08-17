# apiVersion: v1
# kind: Pod
# metadata:
#   name: whatever
# spec:
#   containers:
#     - name: whatever
#       image: index.docker.io/DOCKER_USER/PRIVATE_REPO_NAME:latest
#       imagePullPolicy: Always
#       command: [ "echo", "SUCCESS" ]
#   imagePullSecrets:
#     - name: myregistrykey

# DOCKER_REGISTRY_SERVER=https://index.docker.io/v1/
export DOCKER_REGISTRY_SERVER=https://registry-1.docker.io/v2/
export DOCKER_USER=edorsett
export DOCKER_EMAIL=erik@dorsett.email
export DOCKER_PASSWORD=$1

kubectl create secret docker-registry myregistrykey \
  --docker-server=$DOCKER_REGISTRY_SERVER \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL
