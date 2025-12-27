# Lab 05 – Policy Blackhole Failure
## City Component
Network Policy Blackhole
## Purpose
This lab demonstrates the impact of a misconfigured network policy that creates a blackhole, mapped to the city model.

## Visual
![Policy Blackhole](../../assets/failure-modes/broken-veth-blackhole.svg)

---
## Scenario Description
In this lab, you will simulate a failure where a network policy unintentionally blocks all traffic to a pod or service, creating a blackhole. In the city analogy, this is like a roadblock that prevents any vehicles from reaching a destination, isolating a district.

## Steps
1. Deploy a Kubernetes cluster with a sample application.
2. Apply a restrictive network policy that blocks all ingress and egress traffic to a pod or service.
3. Attempt to access the isolated pod/service.
4. Observe the complete loss of connectivity.

## Expected Outcome
The pod or service will be unreachable, demonstrating the impact of overly restrictive network policies.

## Cleanup
Remove or adjust the network policy to restore connectivity.
