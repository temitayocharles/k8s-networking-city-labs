# Steps

## Step 1: Create a Namespace with a Short-Lived Process
```bash
sudo unshare -n bash
```
In another terminal, check namespaces:
```bash
ip netns list
```
Observation:
- No persistent namespace exists
Exit the shell.

## Step 2: Create a Persistent Namespace Anchor
```bash
sudo ip netns add apartment-2
sudo ip netns exec apartment-2 sleep infinity
```
This sleep process is now the lease holder.

## Step 3: Join the Namespace from Other Processes
```bash
sudo ip netns exec apartment-2 bash
ip link set lo up
python3 -m http.server 8080
```

## Step 4: Kill and Restart Workloads
Exit the shell.
Re-enter again using ip netns exec.
Observation:
- Network state persists
- IP and interfaces remain intact

## Step 5: Pause the Lease Holder
In a new terminal, find the PID of the sleep process:
```bash
pgrep -f 'sleep infinity'
```
Pause the process:
```bash
kill -SIGSTOP <PID>
```

## Step 6: Observe Namespace Behavior
Check namespaces again:
```bash
ip netns list
```
Observation:
- The namespace remains, but is paused.
- Network operations in this namespace are suspended until resumed.

## Step 7: Resume the Lease Holder
Resume the process:
```bash
kill -SIGCONT <PID>
```

## Step 8: Cleanup
Delete the namespace:
```bash
sudo ip netns del apartment-2
```
