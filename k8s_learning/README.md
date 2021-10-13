Памятка по k8s:

#======== From ADV-IT ==========
#======== GCP K8S ==========
gcloud init - настроить gcloud
gcloud services enable container.googleapis.com - разрешить gcloud работать с k8s в проекте
gcloud container clusters create maxim --num-nodes=2 - создать кластер
gcloud container clusters delete maxim - удалить кластер
gcloud container clusters get-credentials maxim - подготовить kubectl для работы с нашим кластером
#======== Pods ==========
kubectl get nodes
kubectl get pods
kubectl run hello --image=nginx:latest --port=80
kubectl port-forward hello 7777:80
kubectl describe pods hello
kubectl delete pods hello
kubectl logs hello
kubectl exec -it hello -- bash
kubectl apply -f manifest.yaml
kubectl delete -f manifest.yaml
#======== Deployments ==========
kubectl create deployment maxim-deployment --image=tmax23/k8s-app
kubectl get deploy
kubectl describe deploy maxim-deployment
kubectl scale deployment maxim-deployment --replicas 4
kubectl get rs
kubectl autoscale deployment maxim-deployment --min=4 --max=6 --cpu-percent=80
kubectl get hpa
kubectl rollout history deployment/maxim-deployment
kubectl rollout status deployment/maxim-deployment
kubectl set image deployment/maxim-deployment k8s-app=tomcat:8.5.38 --record
kubectl rollout undo deployment/maxim-deployment
kubectl rollout undo deployment/maxim-deployment --to-revision=3
kubectl rollout restart deployment/maxim-deployment
kubectl get hpa
#======== Services ==========
kubectl get services
kubectl expose deployment maxim-deployment --type=ClusterIP --port 80
kubectl expose deployment maxim-deployment --type=NodePort --port 80
kubectl expose deployment maxim-deployment --type=LoadBalancer --port 80

#======== From BAKAVETS ==========
kubectl get endpoints -o wide

#======== From TechWorld with Nana ==========
kubectl get all
kubectl get configmap
kubectl get secret
kubectl --help

kubectl cp index.html nginx-deployment-6cbdd46db5-5j7bz:/usr/share/nginx/html
