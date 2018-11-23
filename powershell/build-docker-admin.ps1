# 2. Build Admin service container
cd ../src/Skoruba.IdentityServer4.Admin

dotnet restore

# Production ready build configured to run in docker with SQL DB also extracted to container in local NAT
# TODO: make compatible with Kubernetes and Azure Service Fabric
dotnet build --configuration DockerRelease

npm install

dotnet publish -o ./Publish

# Build dockerfile from /Publish
docker build . -t skoruba-identityserver-admin:latest

# Back to project root
cd ../../powershell/