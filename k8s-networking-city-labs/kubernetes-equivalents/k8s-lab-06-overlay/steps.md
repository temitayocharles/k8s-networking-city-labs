# Steps

## Step 1: Inspect Overlay Interface
```bash
ip link show | grep vxlan
```

## Step 2: Observe Encapsulation
```bash
tcpdump -i vxlan0
```

## Step 3: Deploy Cross-Node Pods
Deploy pods on different nodes and test connectivity:
```bash
kubectl run pod-a --image=busybox -- sleep 3600
kubectl run pod-b --image=busybox -- sleep 3600
kubectl exec pod-a -- ping <pod-b-ip>
```

Observation
- Overlay networks encapsulate pod traffic, allowing flat addressing across nodes, just as city roads connect distant buildings.

## Step 4: Cleanup
Delete the test pods:
```bash
kubectl delete pod pod-a pod-b
```
