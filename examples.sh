#sample gcloud commands
gc compute instances create mytest-instance

gc compute instances add-tags mytest-instance --tags http-server

gc compute images list

gc compute ssh mytest-instance

#set up simple web page
echo 'hello world..' > index.html

#run simple http server on instances
python -m SimpleHTTPServer 80


#LB
#Instance template needed as basis of Managed group LB will use on backend.
#TODO: explore using container instead of start up script to make template deterministic
gcloud compute instance-templates create template-qa \
    --region us-central1 \
    --subnet subnet-us-qa

#Using this template to create instances for a Managed Instance Group (with or without autoscaling)
