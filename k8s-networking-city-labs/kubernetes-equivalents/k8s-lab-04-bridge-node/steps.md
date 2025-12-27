# Steps

## Step 1: Identify Node Bridge
```bash
ip link show
```
Depending on CNI, look for:
- cni0
- flannel.1
- cilium_host

## Step 2: Inspect Bridge Connections
List bridge members:
```bash
bridge link
```

## Step 3: Observe Pod Connectivity
Check which pods are attached to the bridge:
```bash
kubectl get pods -o wide
```

Observation
- The node bridge aggregates pod interfaces, just as a hallway connects apartments in the city analogy.

## Step 4: Cleanup
No action needed unless you created custom resources.
