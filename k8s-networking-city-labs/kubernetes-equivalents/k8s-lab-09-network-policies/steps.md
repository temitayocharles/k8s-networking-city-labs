# Steps

## Step 1: Apply NetworkPolicy
Create a network policy manifest (deny-all.yaml):
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all
spec:
  podSelector: {}
  policyTypes:
    - Ingress
```
Apply the manifest:
```bash
kubectl apply -f deny-all.yaml
```

## Step 2: Observe Enforcement
Test connectivity to pods:
```bash
kubectl exec <pod-name> -- wget -O- http://<target-pod-ip>:80
```

Observation
- Network policies restrict traffic, just as city rules restrict movement between districts in the city analogy.

## Step 3: Cleanup
Delete the network policy:
```bash
kubectl delete -f deny-all.yaml
```
