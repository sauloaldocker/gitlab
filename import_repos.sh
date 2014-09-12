docker stop gitlab
docker stop gitlab_import_repos
docker rm   gitlab_import_repos

SRC=$HOME/data/docker/gitlab
SRC_DATA=$SRC/data
SRC_SQL=$SRC/mysql


docker run --name='gitlab_import_repos' -it \
-e "GITLAB_HTTPS=false" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab:latest \
app:rake gitlab:import:repos

docker rm    gitlab_import_repos
docker start gitlab

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_import_repos | tail -20'

