deep-learning-vm
-

SSH to compute instance:

```
gcloud compute ssh --project <project_id> --zone europe-west4-b deep-learning-vm
```

SSH port forwarding (Jupyter is listening on 8080):

```
gcloud compute ssh --project <project_id> --zone europe-west4-b deep-learning-vm -- -L 8080:localhost:8080
```
