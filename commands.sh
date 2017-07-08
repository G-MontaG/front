d-build-nginx() {
  local tag=${1:-master};
  local repo=${2:-nginx-front};

  command docker build -t ${tag} .
  command docker tag ${tag} gmontag/${repo}:${tag}
  command docker push gmontag/${repo}:${tag}
}

d-stack-deploy() {
  local stack=${1:-front};

  command docker stack deploy --compose-file docker-compose.yml ${stack};
}

d-stack-rm() {
  local stack=${1:-front};

  command docker stack rm ${stack};
}
