## Steps
1. Create three network namespaces (districts).
2. Connect them with bridges and veth pairs to form a loop.
3. Generate broadcast traffic (e.g., ARP) and observe behavior.
4. Identify symptoms of a broadcast storm.
5. Break the loop to restore normal operation.