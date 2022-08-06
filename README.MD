Java + Docker
=============

* [DOCS (Docker) Getting started with Java](https://docs.docker.com/language/java/)

Application create following the instraction of the Docker Java tutorial [Getting started with Java](https://docs.docker.com/language/java/).


Installation and run
---------------------


```bash
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

``` 