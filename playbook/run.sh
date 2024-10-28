#!/bin/bash

cleanup_container() {
  container_name=$1
  if [ "$(docker ps -aq -f name=^/${container_name}$)" ]; then
    echo "Stopping and removing existing container: ${container_name}"
    docker stop ${container_name}
    docker rm ${container_name}
  fi
}

# Удаляем предыдущие контейнеры, если они существуют
cleanup_container centos7
cleanup_container ubuntu
cleanup_container fedora

# Образ ubuntu с python
docker build -t ubuntu-python .

# Запуск контейнеров
docker run -d --name centos7 --hostname centos7 centos:7 sleep infinity
docker run -d --name ubuntu --hostname ubuntu ubuntu-python sleep infinity
docker run -d --name fedora --hostname fedora pycontribs/fedora sleep infinity

ansible-playbook -i inventory/prod.yml site.yml --vault-password-file vault_pass

docker stop centos7 ubuntu fedora
docker rm centos7 ubuntu fedora