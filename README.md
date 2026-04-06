# Secure Multi-Tenant DevOps + GitOps Platform (GCP)

## Overview
This project demonstrates a production-style DevOps setup on GCP with a strong focus on security, GitOps, and multi-tenant architecture.

Built to simulate an integration platform (similar to Exalate), handling secure service communication and tenant-aware requests.

## 🏗️ Architecture
* Client
* ↓
* API (GKE)
* ↓
* Backend (GKE)

## 🔄 Deployment Flow (GitOps)
`Code Push` → `GitHub Actions` → `Artifact Registry` → `Argo CD` → `GKE`

## 🔐 Security Highlights
* Private GKE cluster (no public endpoint)
* Bastion + IAP-based access
* Cloud NAT for controlled egress
* Workload Identity (no static credentials)
* IAM-based access control
* Internal service communication only

## ⚙️ Stack
* **GCP** (GKE, VPC, IAM, NAT, Artifact Registry)
* **Terraform** (modular infra)
* **Kubernetes**
* **Argo CD + Kustomize**
* **GitHub Actions** (CI)

## 📂 Structure
```text
gcp-tf/gcp-infra/
├── envs/dev/        # Terraform env
├── modules/         # Infra modules
└── exalate/         # Services (api, backend)


📈 What’s Implemented
Private GKE cluster with secure access
Terraform-based infrastructure
CI pipeline building and pushing images
GitOps deployment via Argo CD
Multi-service communication (API → backend)
Multi-tenant request propagation


🚧 Next Steps
Replace latest with commit-based image tags
Secret Manager integration
NetworkPolicies
Resource limits & probes
Observability (Prometheus/Grafana)

💬 Notes
This is a working baseline focused on architecture, security, and delivery patterns.
Enhancements listed above can be implemented incrementally.

 Feedback

Open to feedback.

