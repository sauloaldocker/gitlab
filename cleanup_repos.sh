docker stop gitlab
docker stop gitlab_cleanup_repos
docker rm   gitlab_cleanup_repos

source cfg

docker run --name='gitlab_cleanup_repos' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:$VERSION \
app:rake gitlab:cleanup:repos

docker rm    gitlab_cleanup_repos
docker start gitlab

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_cleanup_repos | tail -20'

