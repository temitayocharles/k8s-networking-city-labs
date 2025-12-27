# Lab 03 – veth via CNI
## City Component
veth via CNI
## Purpose
This lab focuses on a single networking concept mapped to the city model.
Complete all steps sequentially.

## Visual
![veth Pair Connection](../../assets/linux/veth-pair.svg)

---
## Scenario Description
In Kubernetes, the CNI plugin creates a veth pair to connect each pod to the host network, just as a door connects an apartment to the hallway in the city analogy. This lab guides you through inspecting pod interfaces, network namespaces, and observing how CNIs automate veth pair creation.

## Steps
See [steps.md](./steps.md) for detailed instructions.

## Objectives
See [objectives.md](./objectives.md) for learning goals.

## Verification
See [verification.md](./verification.md) for how to confirm the lab outcome.

## Cleanup
See [cleanup.md](./cleanup.md) for environment restoration.
