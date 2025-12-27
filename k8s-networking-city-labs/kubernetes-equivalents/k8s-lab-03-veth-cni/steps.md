# Steps

## Step 1: Find Pod Interface on Node
```bash
kubectl get pod apartment -o wide
```
Note the node. SSH to the node:
```bash
ip link | grep veth
```
Match:
- One end in the pod namespace
- One end on the host

## Step 2: Inspect Pod Network Namespace
Find the pod’s network namespace:
```bash
kubectl exec apartment -- ls -l /proc/1/ns/net
```

## Step 3: Observe veth Pair Creation
Review CNI logs or configuration to see how veth pairs are created and attached during pod startup.

Observation
- veth pairs connect pods to the host network, just as doors connect apartments to hallways in the city analogy.

## Step 4: Cleanup
Delete the pod:
```bash
kubectl delete pod apartment
```
