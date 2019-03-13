# docker-pub-server

Docker image for dart Private pub server

Very easy to use.
docker-compose
``` yaml
version: '3'
services:
  pub-server:
    image: idoop/docker-pub-server:latest
    restart: always
    volumes:
    - ./data:/opt/pub_data
    ports:
    - 8080:80
#    environment:
#      PUB_HOST: "0.0.0.0"
#       # If network_mode is host,you can set PUB_PORT value to change server port
#      PUB_PORT: "88"
#    network_mode: host



```


## Environment configuration
- `PUB_HOST`: Default **0.0.0.0**
- `PUB_PORT`: Default **80**
- `PUB_STANDALONE`: Default **TRUE**
