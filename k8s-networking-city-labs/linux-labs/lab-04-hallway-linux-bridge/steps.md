# Steps

## Step 1: Create Bridge
```bash
sudo ip link add br-hallway type bridge
sudo ip link set br-hallway up
```

## Step 2: Attach veth Interfaces
```bash
sudo ip link set veth-hallway master br-hallway
```

## Step 3: Add Second Apartment
Repeat Lab 3 for apartment-4, creating another veth pair and attaching one end to br-hallway.

## Step 4: Verification
Ping between apartments:
```bash
sudo ip netns exec apartment-3 ping 10.0.0.3
```

Observation
Bridges enable same-node pod traffic.
