# Steps

## Step 1: Create Two Buildings (Two VMs or Namespaces)
Simulate two nodes by creating two sets of apartments and bridges.

## Step 2: Add Routing
```bash
ip route add <remote-subnet> via <gateway>
```

## Step 3: Optional VXLAN
```bash
ip link add vxlan100 type vxlan id 100 remote <ip> dstport 4789
```

Observation
Overlays exist to preserve flat pod addressing across nodes.
