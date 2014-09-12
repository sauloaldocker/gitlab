docker stop gitlab_restore_backup; docker rm gitlab_restore_backup

SRC=$HOME/data/docker/gitlab
SRC_DATA=$SRC/data
SRC_SQL=$SRC/mysql


docker run --name='gitlab_add' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:latest \
app:rake gitlab:backup:restore

docker rm gitlab_restore_backup

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_add | tail -20'

