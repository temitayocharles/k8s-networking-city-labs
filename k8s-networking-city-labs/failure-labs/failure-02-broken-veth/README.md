# Lab 02 – Broken veth Pair
## City Component
Broken veth Pair
## Purpose
This lab focuses on a single networking concept mapped to the city model.
Complete all steps sequentially.

## Visual
![Broken veth Pair](../../assets/failure-modes/broken-veth-blackhole.svg)

---
## Scenario Description
In this lab, you will simulate a failure in the city’s road system by breaking the veth pair that connects two network namespaces. This is analogous to a bridge collapse or a road closure in the city analogy, causing communication breakdown between two districts.

## Steps
1. Create two network namespaces (districts).
2. Connect them with a veth pair (road).
3. Verify connectivity using `ping`.
4. Simulate failure by deleting one end of the veth pair.
5. Observe and verify the loss of connectivity.

## Expected Outcome
After breaking the veth pair, the two namespaces will no longer be able to communicate, demonstrating the impact of a broken link in the network.

## Cleanup
Restore the environment by recreating the veth pair or deleting the namespaces.
