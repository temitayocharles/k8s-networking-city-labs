# Steps

## Step 1: Create a Service
Create a service manifest (service.yaml):
```yaml
apiVersion: v1
kind: Service
metadata:
  name: front-desk
spec:
  selector:
    app: apartment
  ports:
    - port: 80
      targetPort: 8080
```
Apply the manifest:
```bash
kubectl apply -f service.yaml
```

## Step 2: Test Service Access
Get the service ClusterIP:
```bash
kubectl get svc front-desk
```
Test access from a pod:
```bash
kubectl exec <pod-name> -- wget -O- http://<service-cluster-ip>:80
```

Observation
- Services provide stable access points, just as a front desk routes visitors to apartments in the city analogy.

## Step 3: Cleanup
Delete the service:
```bash
kubectl delete svc front-desk
```
