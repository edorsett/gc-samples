kubectl run alpaca-prod   --image=gcr.io/kuar-demo/kuard-amd64:1   --replicas=2   --labels="ver=1,app=alpaca,env=prod"
kubectl expose deployment alpaca-prod --port=8080
kubectl get services -o wide
ALPACA_POD=$(kubectl get pods -l app=alpaca \
    -o jsonpath='{.items[0].metadata.name}')
kubectl port-forward $ALPACA_POD 48858:8080
# http://localhost:48858

#NodePort
kubectl edit service alpaca-prod # and change spec.type to NodePort
gcloud container clusters get-credentials edor-cluster     --zone us-west1-a --project ps-edorsett
get pods -o wide
kubectl describe nodes
kubectl describe nodes gke-edor-cluster-default-pool-3926df3e-cnwb
ssh 104.199.114.204 -L 8080:localhost:32711
#http://localhost:8080 you will be accessing that service. You’ll be directed to one of the ready pods for that service. Hit refresh a few times and see that you get assigned a pod at random.
#TODO: not working. ssh doesn't recognize key for node's external ip...

#Cloud Integration
kubectl edit service alpaca-prod # and change spec.type to LoadBalancer.
curl http://35.197.19.165:8080
kubectl describe endpoints alpaca-prod
kubectl get endpoints alpaca-prod --watch
