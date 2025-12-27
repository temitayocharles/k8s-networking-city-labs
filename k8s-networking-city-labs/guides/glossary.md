# Glossary: Kubernetes Networking City Analogy

- **Apartment (Pod):** A single living space, representing a pod in Kubernetes.
- **Roommate (Container):** A container inside a pod, sharing the same apartment (network namespace).
- **Building (Node):** A physical or virtual machine hosting apartments (pods).
- **Hallway (Bridge):** The Linux bridge connecting apartments within a building.
- **Door (veth pair):** The virtual Ethernet pair connecting an apartment to the hallway.
- **Front Desk (Service):** The access point that routes visitors to the correct apartment.
- **City Planner (CNI):** The automation system that sets up apartments, hallways, and doors.
- **Roads (Overlay/Tunnel):** The network routes connecting different buildings.
- **Security (Network Policy):** The rules restricting movement between apartments or buildings.
- **Lease Holder (Pause Container):** The process that keeps the apartment (pod) alive and networked.
