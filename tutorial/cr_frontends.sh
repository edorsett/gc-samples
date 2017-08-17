echo "apt-get update && apt-get install -y apache2 && hostname > /var/www/index.html" > \
$HOME/gce:startup.sh

gcloud compute instances create frontend-us1 --image debian-8 \
--zone us-central1-a --metadata-from-file startup-script=$HOME/gce:startup.sh


gcloud compute instances create frontend-us2 --image debian-8 \
--zone us-central1-b --metadata-from-file startup-script=$HOME/gce:startup.sh

gcloud compute instances create frontend-eu1 --image debian-8 --zone europe-west1-b --metadata-from-file startup-script=$HOME/gce:startup.sh


gcloud compute instances create frontend-eu2 --image debian-8 \
--zone europe-west1-c --metadata-from-file startup-script=$HOME/gce:startup.sh