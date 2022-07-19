## Run Development

The project contains the postgres database in which all arrays of articles are stored. Hasura is used as the interface for working with the database. (application to work with graphQL)

To run the database and hasura. You need to create docker containers from the file `docker-compose.yml`.

you need to have `docker` and `docker-compose` installed on your computer

docker: https://docs.docker.com/
docker-compose: https://docs.docker.com/compose/install/

Development start order:
1. Clone the project to a local directory.
2. Complete `sudo docker-compose up -d` from root project dir.
3. Complete `npm run dev`

<br>

## Run Build

Build start order:

if you have already started development, you do not need to do steps 1 and 2.

1. Clone the project to a local directory.
2. Complete `sudo docker-compose up -d` from root project dir.
3. Complete `npm run build`
4. Complete `npm run generate`

### for Linux 

If you do not have permissions configured in the operating system, an error may occur when executing the `npm run generate` command. Set full permissions for the directory `dist`: `sudo chmod 777 dist`


## Commemts
Please note that the project has a container with a script (php) for sending messages. But due to the policy change google the script will not work.
