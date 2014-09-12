docker stop gitlab_add; docker rm gitlab_add

SRC=$HOME/data/docker/gitlab
SRC_DATA=$SRC/data
SRC_SQL=$SRC/mysql


docker run --name='gitlab_add' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:latest \
app:rake gitlab:import:repos

docker rm gitlab_add

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_add | tail -20'

