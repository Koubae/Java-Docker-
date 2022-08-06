
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