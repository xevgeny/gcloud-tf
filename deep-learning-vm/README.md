# deep-learning-vm

SSH to compute instance:

```
gcloud beta compute ssh --project <project_id> --zone "europe-west4-b" "deep-learning-vm" --tunnel-through-iap 
```

SSH port forwarding (Jupyter is listening on 8080):

```
gcloud beta compute ssh --project <project_id> --zone "europe-west4-b" "deep-learning-vm" --tunnel-through-iap -- -L 8080:localhost:8080
```
