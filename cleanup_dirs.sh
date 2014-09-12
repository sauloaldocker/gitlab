docker stop gitlab
docker stop gitlab_cleanup_dirs
docker rm   gitlab_cleanup_dirs

source cfg


docker run --name='gitlab_cleanup_dirs' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:$VERSION \
app:rake gitlab:cleanup:dirs

docker rm    gitlab_cleanup_dirs
docker start gitlab

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_cleanup_dirs | tail -20'

