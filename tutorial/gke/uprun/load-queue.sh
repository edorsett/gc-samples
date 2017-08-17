# Create a work queue called 'keygen'
curl -X PUT localhost:8080/memq/server/queues/keygen2

# Create 100 work items and load up the queue.
for i in work-item-{0..5}; do
  curl -X POST localhost:8080/memq/server/queues/keygen2/enqueue \
    -d "$i"
done
