# 1. build auth service container
cd ../src/skoruba.identityserver4.sts.identity

dotnet restore

# Production ready build configured to run in docker with SQL DB also extracted to container in local NAT
# TODO: make compatible with Kubernetes and Azure Service Fabric
dotnet build --configuration DockerRelease

npm install

dotnet publish -o ./Publish

# Build dockerfile from /Publish
docker build . -t skoruba-identityserver-sts:latest

# Back to project root
cd ../../powershell/