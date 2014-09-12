docker stop gitlab
docker stop gitlab_restore_backup
docker rm   gitlab_restore_backup

source cfg


docker run --name='gitlab_restore_backup' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:$VERSION \
app:rake gitlab:backup:restore

docker rm    gitlab_restore_backup
docker start gitlab

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_restore_backup | tail -20'

