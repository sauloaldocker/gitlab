docker stop gitlab
docker stop gitlab_cleanup_dirs
docker rm   gitlab_cleanup_dirs

SRC=$HOME/data/docker/gitlab
SRC_DATA=$SRC/data
SRC_SQL=$SRC/mysql


docker run --name='gitlab_cleanup_dirs' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:latest \
app:rake gitlab:cleanup:dirs

docker rm    gitlab_cleanup_dirs
docker start gitlab

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_add | tail -20'

