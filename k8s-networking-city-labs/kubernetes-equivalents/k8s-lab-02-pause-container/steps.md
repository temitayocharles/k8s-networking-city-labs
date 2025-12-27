# Steps

## Step 1: Identify the Pause Container
```bash
kubectl get pod apartment -o jsonpath='{.status.containerStatuses[*].containerID}'
```
On the node:
```bash
crictl ps
```
Look for:
- Container named "pause"
- Same network namespace as workload containers

## Step 2: Pause the Container
Simulate pausing the pod by stopping the pause container (advanced, for demonstration):
```bash
crictl stop <pause-container-id>
```

Observation
- Pausing the container suspends pod networking, similar to pausing the lease holder in Linux.

## Step 3: Resume the Container
Restart the pause container:
```bash
crictl start <pause-container-id>
```

## Step 4: Cleanup
Delete the pod:
```bash
kubectl delete pod apartment
```
