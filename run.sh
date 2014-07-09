#https://registry.hub.docker.com/u/sameersbn/gitlab/#version

#docker stop gitlab; docker rm gitlab

#sudo rm -rf app/*
#sudo rm -rf data/*
#sudo rm -rf mysql/*

#mkdir -p app
#mkdir -p data
#mkdir -p mysql

docker run --name='gitlab' -d  \
-p 127.0.1.1:10022:22 \
-p 127.0.1.1:10080:80 \
-p 127.0.1.1:10443:443 \
-e "GITLAB_PORT=10080" \
-e "GITLAB_SSH_PORT=10022" \
-e "GITLAB_HTTPS=false" \
-v $PWD/data:/home/git/data \
-v $PWD/mysql:/var/lib/mysql \
sameersbn/gitlab:7.0.0

watch 'docker ps -a | grep gitlab ;docker logs gitlab | tail -20'


