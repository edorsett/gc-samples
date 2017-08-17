gc compute disks create --size=200GB --zone=us-west1-a database --labels="volume=my-volume" --image debian-8
gc compute disks list --filter labels.volume=my-volume
