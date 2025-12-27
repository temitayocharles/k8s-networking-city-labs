# Steps

## Step 1: Create Namespace
```bash
sudo ip netns add apartment-3
sudo ip netns exec apartment-3 ip link set lo up
```

## Step 2: Create veth Pair
```bash
sudo ip link add veth-apartment type veth peer name veth-hallway
```

## Step 3: Attach One End to Namespace
```bash
sudo ip link set veth-apartment netns apartment-3
```

## Step 4: Assign IPs
```bash
sudo ip netns exec apartment-3 ip addr add 10.0.0.2/24 dev veth-apartment
sudo ip addr add 10.0.0.1/24 dev veth-hallway
sudo ip netns exec apartment-3 ip link set veth-apartment up
sudo ip link set veth-hallway up
```

Observation
The apartment now has a door to the building.
