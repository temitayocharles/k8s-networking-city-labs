# Steps

## Step 1: Inspect CNI Plugins
```bash
ls /opt/cni/bin
ls /etc/cni/net.d
```

## Step 2: Observe Automation
Review how CNI plugins automate pod networking setup.

## Step 3: Deploy a Pod and Observe Networking
```bash
kubectl run cni-test --image=busybox -- sleep 3600
kubectl exec cni-test -- ip addr
```

Observation
- CNI plugins automate the manual networking steps, just as a city planner automates city infrastructure.

## Step 4: Cleanup
Delete the test pod:
```bash
kubectl delete pod cni-test
```
