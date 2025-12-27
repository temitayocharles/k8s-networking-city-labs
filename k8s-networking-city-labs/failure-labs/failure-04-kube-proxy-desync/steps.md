# Steps

## Steps
1. Deploy a Kubernetes cluster with multiple nodes.
2. Stop kube-proxy on one node to simulate desynchronization.
3. Attempt to access services from different nodes.
4. Observe routing failures and traffic misdirection.
5. Restart kube-proxy to restore normal operation.
