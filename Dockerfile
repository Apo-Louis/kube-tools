FROM alpine:latest

LABEL maintainer="alimoviee@gmail.com"

# Mise à jour des paquets et installation des dépendances nécessaires
RUN apk update && apk add --no-cache \
    curl \
    gnupg \
    ca-certificates \
    lsb-release \
    openssl \
    bash && \
    rm -rf /var/cache/apk/*

# Installation de kubectl directement via téléchargement du binaire
RUN curl -fsSL https://dl.k8s.io/release/v1.31.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Installation de Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Kubeconform Installation
RUN curl -L https://github.com/yannh/kubeconform/releases/latest/download/kubeconform-linux-amd64.tar.gz | tar xz && \
    mv kubeconform /usr/local/bin/ && \
    chmod +x /usr/local/bin/kubeconform


RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq

# Nettoyage
RUN rm -rf /var/cache/apk/*

# Création du répertoire .kube
RUN mkdir -p /root/.kube

CMD ["bash", "-c", "while true; do sleep 1000; done"]
