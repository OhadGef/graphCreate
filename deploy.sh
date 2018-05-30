#!/bin/bash

echo "start deploy"

version=$1

echo "version $version"
if [ -z "$version" ]
then
   echo "Missing deployment version"
fi

echo "start deploying version $version on create-gragh"

eval $(aws ecr get-login --no-include-email --region eu-central-1)

docker build -t "create-gragh:$version" .

docker tag create-gragh:"$version" "create-gragh:latest"
docker tag create-gragh:latest 223455578796.dkr.ecr.eu-west-1.amazonaws.com/create-gragh:latest
docker tag create-gragh:latest 223455578796.dkr.ecr.eu-west-1.amazonaws.com/create-gragh:$version

docker push 223455578796.dkr.ecr.eu-west-1.amazonaws.com/create-gragh:latest
docker push 223455578796.dkr.ecr.eu-west-1.amazonaws.com/create-gragh:$version

echo "deployment succeeded";

PAUSE
read -n1 -r -p "Press any key to continue..." key