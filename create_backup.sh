docker stop gitlab
docker stop gitlab_create_backup
docker rm   gitlab_create_backup

source cfg

docker run --name='gitlab_create_backup' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:$VERSION \
app:rake gitlab:backup:create

docker rm    gitlab_create_backup
docker start gitlab

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_create_backup | tail -20'

