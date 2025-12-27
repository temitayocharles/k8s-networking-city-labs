# Steps

## Step 1: Create the Apartment (Network Namespace)
```bash
sudo ip netns add apartment-1
```
Verify:
```bash
sudo ip netns list
```
Expected output includes apartment-1.

## Step 2: Enter the Apartment
```bash
sudo ip netns exec apartment-1 bash
```
Inside the namespace:
```bash
ip addr
```
Expected:
- Only lo (loopback)
- No external interfaces

## Step 3: Activate Loopback
```bash
ip link set lo up
```
Verify:
```bash
ip addr show lo
```
State should be UP.

## Step 4: Start a Service (Roommate 1)
Open a terminal:
```bash
sudo ip netns exec apartment-1 bash
python3 -m http.server 8080
```

## Step 5: Access the Service (Roommate 2)
Open another terminal:
```bash
sudo ip netns exec apartment-1 bash
curl http://127.0.0.1:8080
```
You should receive an HTTP directory listing.

Observation
Both processes:
- Share localhost
- Share the same network stack
- Behave as if they are on the same machine
This is a pod.
