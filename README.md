## Run Development

The project contains the postgres database in which all arrays of articles are stored. Hasura is used as the interface for working with the database. (application to work with graphQL)

To run the database and hasura. You need to create docker containers from the file `docker-compose.yml`.

you need to have `docker` and `docker-compose` installed on your computer

docker: https://docs.docker.com/
docker-compose: https://docs.docker.com/compose/install/

Development start order:
1. Clone the project to a local directory.
2. Complete `sudo docker-compose up -d` from root project dir.
3. Complete `npm install`
4. Complete `npm run dev`

<br>

## Run Build

Build start order:

if you have already started development, you do not need to do steps 1, 2 and 3.

1. Clone the project to a local directory.
2. Complete `sudo docker-compose up -d` from root project dir.
3. Complete `npm install`
4. Complete `npm run build`
5. Complete `npm run generate`

### for Linux 

If you do not have permissions configured in the operating system, an error may occur when executing the `npm run generate` command. Set full permissions for the directory `dist`: `sudo chmod 777 dist`


## Run on Server 

The project contains a container with `nginx` configured to run the site on the server. For this you need:
1. Clone the repository to a local folder on the server.
2. Run `npm install && npm run build && npm run generate`
3. In the file `docker-compose.yml` it is necessary for the container `nginx_web_server` to change the port value from 5555 to 80. It should be like this 
```
  nginx_web_server:
    image: nginx
    restart: always
    ports:
      - 80:80
```  
4. Complete `sudo docker-compose up -d`
<br>
The site will be accessible from port 80 at the server address.

## Commemts
Please note that the project has a container with a script (php) for sending messages. But due to the policy change google the script will not work.
