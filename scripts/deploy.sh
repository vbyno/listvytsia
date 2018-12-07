#!/bin/bash

env=staging
remote_dir='/home/deployer/listvytsia_staging/listvytsia'
SERVER_IP=185.69.153.54

scp -P $SERVER_PORT .env $SERVER_USER@$SERVER_IP:$remote_dir
scp -P $SERVER_PORT \
  config/application.yml \
  config/secrets.yml \
  $SERVER_USER@$SERVER_IP:$remote_dir/config/

ssh $SERVER_USER@$SERVER_IP -p $SERVER_PORT <<EOSSH
  cd $remote_dir
  docker-compose down
  docker-compose up --build
EOSSH

exit 0
