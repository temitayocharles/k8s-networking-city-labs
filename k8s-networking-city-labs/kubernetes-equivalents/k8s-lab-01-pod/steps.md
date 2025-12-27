# Steps

## Step 1: Create a Pod
Create a pod manifest (pod.yaml):
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: apartment
spec:
  containers:
    - name: roommate-1
      image: busybox
      command: ["sleep", "3600"]
    - name: roommate-2
      image: busybox
      command: ["sleep", "3600"]
```
Apply the manifest:
```bash
kubectl apply -f pod.yaml
```

## Step 2: Inspect Pod Networking
Check pod IP and network namespace:
```bash
kubectl get pod apartment -o wide
kubectl exec apartment -- ip addr
```

Observation
- Pod acts as an apartment, with containers as roommates sharing the same address space.

## Step 3: Cleanup
Delete the pod:
```bash
kubectl delete pod apartment
```
