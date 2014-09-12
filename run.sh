#https://registry.hub.docker.com/u/sameersbn/gitlab/#version

#docker stop gitlab; docker rm gitlab

#sudo rm -rf app/*
#sudo rm -rf data/*
#sudo rm -rf mysql/*

#mkdir -p app
#mkdir -p data
#mkdir -p mysql

docker stop gitlab
sleep 2
docker rm gitlab

SRC=$HOME/data/docker/gitlab
SRC_DATA=$SRC/data
SRC_SQL=$SRC/mysql

docker run --name='gitlab' -d  \
-p 127.0.1.1:10022:22 \
-p 127.0.1.1:10080:80 \
-p 127.0.1.1:10443:443 \
-e "GITLAB_PORT=10080" \
-e "GITLAB_SSH_PORT=10022" \
-e "GITLAB_HTTPS=false" \
-e "GITLAB_PROJECTS_VISIBILITY=public" \
-e "GITLAB_BACKUPS=daily" \
-e "GITLAB_BACKUP_EXPIRY=604800" \
-v $SRC_DATA:/home/git/data \
-v $SRC_SQL:/var/lib/mysql \
sameersbn/gitlab

watch 'docker ps -a | grep gitlab ;docker logs gitlab | tail -20'


