docker build . -t apoolouis8/kube_tools:latest

docker push apoolouis8/kube_tools:latest
# ❯ docker run -v ~/Downloads/config:/home/k8suser/.kube/config apoolouis8/kube_tools:latest helm list


# docker run --rm -v ~/.kube/config:/home/k8suser/.kube/config apoolouis8/kube_tools:latest kubectl get pods

# docker run --rm -v /root/.kube/config:/home/k8suser/.kube/config apoolouis8/kube_tools:latest kubectl get pods
