# Steps

## Step 1: Observe Pod Communication
```bash
kubectl get pods -o wide
```
Pods on the same node communicate directly; no tunnel is used.

## Step 2: Cross-Node Communication
Deploy pods on different nodes and test connectivity:
```bash
kubectl run pod-a --image=busybox -- sleep 3600
kubectl run pod-b --image=busybox -- sleep 3600
kubectl exec pod-a -- ping <pod-b-ip>
```

Observation
- Cross-node communication may use overlays or tunnels, depending on CNI.

## Step 3: Inspect Overlay/Tunnel
Check for VXLAN or other overlay interfaces on the nodes:
```bash
ip link | grep vxlan
```

## Step 4: Cleanup
Delete the test pods:
```bash
kubectl delete pod pod-a pod-b
```
