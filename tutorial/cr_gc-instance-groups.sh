# Step 1 - gcloud commands to create echo Instances groups

# gcloud compute Instance-groups --zone us-central1-a create ig-usc1a
# echo Instance group ig-usc1a created.
# gcloud compute Instance-groups --zone us-central1-b create ig-usc1b
# echo Instance group ig-usc1b created.
# gcloud compute Instance-groups --zone europe-west1-b create ig-euw1b
# echo Instance group ig-euw1b created.
# gcloud compute Instance-groups --zone europe-west1-c create ig-euw1c
# echo Instance group ig-euw1c created.
# gcloud compute Instance-groups --zone asia-east1-a create ig-ape1a
# echo Instance group ig-ape1a created.
# gcloud compute Instance-groups --zone asia-east1-b create ig-ape1b

echo "apt-get update && apt-get install -y apache2 && hostname > /var/www/index.html" > \
$HOME/gce:startup.sh

gcloud compute instance-templates create example-template-with-startup \
    --image-family debian-8 \
    --image-project debian-cloud \
    --metadata startup-script=$HOME/gce:startup.sh
    
gcloud compute instance-groups managed create \
  example-managed-instance-group --zone us-central1-a \
  --template example-template-with-startup --size 1
  
gcloud compute backend-services create web-service --http-health-checks http-check
  
gcloud compute backend-services add-backend web-service --instance-group example-managed-instance-group --global --zone us-central1-a
  
 
 gcloud compute backend-services get-health web-service
 
#  status:
#   healthStatus:
#   - healthState: UNHEALTHY
#     instance: https://www.googleapis.com/compute/v1/projects/ps-edorsett/zones/us-central1-a/instances/example-managed-instance-group-j4z1
#     port: 80
#   kind: compute#backendServiceGroupHealth
 
 gcloud compute backend-services describe web-service --global
 
 gcloud compute url-maps create web-map --default-service web-service
 
 gcloud compute target-http-proxies create web-proxy --url-map web-map
 
 gcloud compute forwarding-rules create http-rule --global \
--target-http-proxy web-proxy --port-range 80