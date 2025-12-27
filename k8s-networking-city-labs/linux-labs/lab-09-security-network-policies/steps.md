# Steps

## Step 1: Default Allow
Observe unrestricted traffic between apartments.

## Step 2: Add iptables DROP
```bash
sudo iptables -A FORWARD -s 10.0.0.2 -d 10.0.0.3 -j DROP
```

## Step 3: Verify Isolation
Test connectivity and confirm traffic is blocked.

Observation
Policies are enforced, not magical.
