# must first create a cluster for pods to land on. TODO: figure out cmd line.
kubectl create -f influxdb-pod.yml
kubectl expose pod influxdb --type=LoadBalancer --port 8083 --name=influxdb-frontend
delete pods/influxdb
