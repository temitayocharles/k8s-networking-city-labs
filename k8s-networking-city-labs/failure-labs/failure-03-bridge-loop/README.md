# Lab 03 – Bridge Loop Failure
## City Component
Bridge Loop
## Purpose
This lab demonstrates the impact of a bridge loop in a network, mapped to the city model.

## Visual
![Bridge Loop](../../assets/failure-modes/hallway-bridge-analogy.svg)

---
## Scenario Description
In this lab, you will simulate a bridge loop, which is analogous to a circular road in the city that causes traffic to endlessly circulate without reaching its destination. In networking, a bridge loop can cause broadcast storms and network congestion.

## Steps
1. Create three network namespaces (districts).
2. Connect them with bridges and veth pairs to form a loop.
3. Observe the behavior using broadcast traffic (e.g., ARP).
4. Identify the symptoms of a broadcast storm or endless traffic loop.

## Expected Outcome
The network will experience excessive broadcast traffic, demonstrating the dangers of bridge loops in both city and network models.

## Cleanup
Break the loop by removing one connection or deleting the namespaces.
