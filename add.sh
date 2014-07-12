docker stop gitlab_add; docker rm gitlab_add

docker run --name='gitlab_add' -it \
-e "GITLAB_HTTPS=false" \
-v $PWD/data:/home/git/data \
-v $PWD/mysql:/var/lib/mysql \
sameersbn/gitlab:7.0.0 \
app:rake gitlab:import:repos

docker rm gitlab_add

#watch 'docker ps -a | grep gitlab ;docker logs gitlab_add | tail -20'

