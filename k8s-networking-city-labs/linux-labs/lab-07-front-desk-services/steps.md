# Steps

## Step 1: Create iptables Rule
```bash
sudo iptables -t nat -A PREROUTING -d 10.96.0.10 -j DNAT --to-destination 10.0.0.2
```

## Step 2: Test Load Distribution
Rotate backend IPs and observe traffic redirection.

Observation
Services are traffic indirection, not endpoints.
