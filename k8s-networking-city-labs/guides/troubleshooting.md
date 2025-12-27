# Troubleshooting: Kubernetes Networking City Analogy

- **Pod can’t reach another pod:** Check if the hallway (bridge) or door (veth) is missing or misconfigured.
- **Pod is isolated:** Look for restrictive security (network policy) rules.
- **Service not reachable:** Ensure the front desk (service) is set up and points to the right apartments.
- **Cross-node communication fails:** Inspect roads (overlay/tunnel) and city planner (CNI) configuration.
- **Pod disappears after process exit:** The lease holder (pause container) may have exited or been paused.
- **Network storm:** Check for bridge loops (multiple hallways connected in a loop).
