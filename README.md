# Terraform Secure Infra Lab

A modular Infrastructure-as-Code project that provisions a secure cloud environment with Terraform.
The setup includes a Virtual Network, public and private subnets, bastion and private VMs, Network Security Groups (NSGs), and secret management using Key Vault.
Security principles such as least privilege, managed identity, and secure-by-design are applied throughout.

---

## 📌 Project Overview
This project demonstrates how to:
- Create a virtual network with segregated **public and private subnets**.
- Apply **NSG rules** (allow SSH/RDP only from your IP, deny all else).
- Deploy a **bastion VM** in the public subnet with a public IP.
- Deploy a **private VM** in the private subnet (no public IP).
- Generate **SSH keys automatically**.
- Store secrets securely in **Key Vault**.
- Use **system-assigned Managed Identity** for the VM to access secrets.
- Apply **least privilege principles** for IAM roles and permissions.

---

## 🗂️ Project Phases
1. **Setup & Preparation**
   Install tools, authenticate to the cloud, create repo, draft architecture diagram.

2. **Network Setup**
   Provision VNet/VPC, subnets, and NSG/Security Groups.

3. **Compute (VMs)**
   Deploy a bastion VM (public subnet) and a private VM (private subnet).
   Validate connectivity (Your IP → Bastion → Private VM).

4. **Security & Identity**
   Create Key Vault, store secrets, enable managed identity, assign Reader role.

5. **Integration & Final Delivery**
   Wire modules together, validate full flow, document security measures.

---

## 🚀 Getting Started

### Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Cloud CLI (Azure CLI or AWS CLI, depending on provider)
- Git

### Clone the Repo
```bash
git clone https://github.com/<your-org>/terraform-secure-infra-lab.git
cd terraform-secure-infra-lab
