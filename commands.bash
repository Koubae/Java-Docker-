
# Test run application
cd app
./mvnw spring-boot:run

##########################################
#            DOCKER                      #
##########################################

# Build Image 
docker build --tag java-docker .
# View image 
docker images
# Add Version tag to image 
docker tag java-docker:latest java-docker:v1.0.0
# Remove docker image  
docker rmi java-docker:v1.0.0

# Run Container 
docker run java-docker


# build container 
docker build --tag java-learn:v1.0.0  
# Run 
docker run --publish 8080:8080 java-learn:v1.0.0 
# Or run in detached mode
docker run -d -p 8080:8080 java-learn:v1.0.0 

## Test run 

curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'


## Create Volumes
docker volume create mysql_data
docker volume create mysql_config
# Create a network 
docker network create mysqlnet

# Run MySQL
docker run -it --rm -d -v mysql_data:/var/lib/mysql \
    -v mysql_config:/etc/mysql/conf.d \
    --network mysqlnet \
    --name mysqlserver \
    -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic \
    -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic \
    -p 3306:3306 mysql:8.0


# Run spring boot 
docker run --rm -d \
    --name springboot-server \
    --network mysqlnet \
    -e MYSQL_URL=jdbc:mysql://mysqlserver/petclinic \
    -p 8080:8080 java-docker

# Make a request 
curl  --request GET \
    --url http://localhost:8080/vets \
    --header 'content-type: application/json'


# Build with Docker composer 
 docker-compose -f docker-compose.dev.yml up --build