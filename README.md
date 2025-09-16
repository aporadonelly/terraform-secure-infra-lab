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

## Getting Started

### Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Cloud CLI (Azure CLI)
- Git

### Clone the Repo
```bash
git clone https://github.com/aporadonelly/terraform-secure-infra-lab.git
cd terraform-secure-infra-lab
```

### Work in Your Own Branch
```bash
git checkout -b feature/<your-name>
git add .
git commit -m "Added network module resources"
git push origin feature/<your-name>

Then, open a Pull Request (PR) into main when your part is ready. Our teammate will review and will merge.
```


## Repo Structure
.
├── main.tf                # Root configuration
├── variables.tf           # Global variables
├── outputs.tf             # Global outputs
├── modules/
│   ├── network/           # VNet, subnets, NSGs
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── compute/           # Bastion + Private VMs
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── keyvault/          # Key Vault + secrets + IAM
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md


## 👥 Team Roles

Networking Lead – VNet, subnets, NSGs.

Compute Lead – Bastion and private VMs.

Security Lead – Key Vault, secrets, managed identity.

Integration & Docs Lead – Root wiring, outputs, documentation.
