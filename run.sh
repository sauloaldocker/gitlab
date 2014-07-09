#https://registry.hub.docker.com/u/sameersbn/gitlab/#version

docker stop gitlab; docker rm gitlab

sudo rm -rf app/*
sudo rm -rf data/*
sudo rm -rf mysql/*

mkdir -p app
mkdir -p data
mkdir -p mysql

docker run --name='gitlab' -d  \
-p 127.0.1.1:10022:22 \
-p 127.0.1.1:10080:80 \
-e "GITLAB_PORT=10080" \
-e "GITLAB_SSH_PORT=10022" \
-e "GITLAB_HTTPS=false" \
-v $PWD/data:/home/git/data \
-v $PWD/mysql:/var/lib/mysql \
sameersbn/gitlab:7.0.0

watch 'docker ps -a | grep gitlab ;docker logs gitlab | tail -20'
#-v $PWD/app:/app \
#-v $PWD/redis:/var/lib/redis \
#-e "DB_PASS=gitlabpassword" \



#    username: admin@local.host
#    password: 5iveL!fe
#    User: root Password: leiN2thi9dei


#docker run --name=gitlab -i -t --rm [OPTIONS] sameersbn/gitlab:7.0.0 app:rake gitlab:backup:create


#Creating backups
#
#Gitlab defines a rake task to easily take a backup of your gitlab installation. The backup consists of all git repositories, uploaded files and as you might expect, the sql database.
#
#Before taking a backup, please make sure that the gitlab image is not running for obvious reasons
#
#docker stop gitlab
#To take a backup all you need to do is run the gitlab rake task to create a backup.
#
#docker run --name=gitlab -i -t --rm [OPTIONS] sameersbn/gitlab:7.0.0 app:rake gitlab:backup:create
#A backup will be created in the backups folder of the Data Store



#Restoring Backups
#
#Gitlab defines a rake task to easily restore a backup of your gitlab installation. Before performing the restore operation please make sure that the gitlab image is not running.
#
#docker stop gitlab
#To restore a backup, run the image in interactive (-i -t) mode and pass the “app:restore” command to the container image.
#
#docker run --name=gitlab -i -t --rm [OPTIONS] sameersbn/gitlab:7.0.0 app:rake gitlab:backup:restore



#Rake Tasks
#
#The app:rake command allows you to run gitlab rake tasks. To run a rake task simply specify the task to be executed to the app:rake command. For example, if you want to gather information about GitLab and the system it runs on.
#
#docker run --name=gitlab -d [OPTIONS] sameersbn/gitlab:7.0.0 app:rake gitlab:env:info
#Similarly, to import bare repositories into GitLab project instance
#
#docker run --name=gitlab -d [OPTIONS] sameersbn/gitlab:7.0.0 app:rake gitlab:import:repos
#For a complete list of available rake tasks please refer https://github.com/gitlabhq/gitlabhq/tree/master/doc/raketasks or the help section of your gitlab installation.
