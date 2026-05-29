set -e # run the script in bash and exit if any command fails

# name of the api
NAME="kubernetes-demo-api"

#USERNAME
USERNAME="punjabigabru"

#Docker Image
IMAGE=$USERNAME/$NAME:latest

#print in bash
echo "Building docker image..."
docker build -t $IMAGE .

#push the image to the docker hub
echo "Pushing docker image to the docker hub..."
docker push $IMAGE

#applying kubernetes deployment and service
echo "Applying kubernetes menifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# getting the pods
echo "Getting pods..."
kubectl get pods

# getting the services
echo "Getting services..."
kubectl get services

#fetching the main service
echo "Fetching the main service..."
kubectl get service $NAME-service
