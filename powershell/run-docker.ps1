# $confirmation = Read-Host "Build docker image for STS project? (y/n):"
# if ($confirmation -eq 'y') {
  ./build-docker-sts.ps1
# }

# $confirmation = Read-Host "Build docker image for Admin project? (y/n):"
# if ($confirmation -eq 'y') {
  ./build-docker-admin.ps1
# }

# 3. create infrastructure
# remove docker network if exists
docker network remove skoruba-identityserver-network

# create docker network
docker network create skoruba-identityserver-network

# create docker volume for sql containter
docker volume create skoruba-identityserver-sql

cd ../

docker-compose down

docker-compose up -d
	
	