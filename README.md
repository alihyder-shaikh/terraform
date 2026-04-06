# 🚀 Secure Multi-Tenant DevOps + GitOps Platform on GCP

## Overview
This project demonstrates a production-style DevOps setup on Google Cloud Platform, focusing on secure infrastructure, GitOps delivery, and multi-tenant service design.

It simulates an integration platform (similar to Exalate), where services communicate securely and handle tenant-aware requests across internal components.

---

## 🏗️ Architecture

### Application Flow
* **Client**
* ↓
* **API Service (GKE)**
* ↓
* **Backend Service (GKE)**

* API acts as the entry point
* Backend is an internal-only service
* Communication via Kubernetes ClusterIP

### Deployment Flow (GitOps)
`Code Push` → `GitHub Actions (Build & Push)` → `Artifact Registry` → `Argo CD (Auto Sync)` → `GKE Deployment`

### Network & Access Flow
`Developer` → `IAP SSH` → `Bastion Host` → `Private GKE Cluster`

---

## ☁️ Infrastructure (Terraform)
Provisioned using a modular Terraform structure:

* **VPC** with custom subnet
* **Cloud Router + NAT** (private outbound traffic)
* **Firewall rules** (IAP-based access)
* **Private GKE cluster** (no public control plane)
* **Node pool** (cost-optimized)
* **Bastion host** for secure cluster access
* **Remote state** stored in GCS

### Modules
* `network`
* `gke`
* `firewall`
* `gce`
* `iam` (extendable)

---

## ⚙️ Application Layer

### Services
* **API Service:** Entry point for client requests; handles tenant propagation via headers/JWT.
* **Backend Service:** Internal processing layer; only accessible within cluster.

### Service Communication
* **Flow:** Client → API → Backend
* Internal traffic restricted within cluster
* No public exposure of backend service

### Features
* Dockerized services
* Kubernetes Deployments + Services
* Multi-tenant request propagation
* Internal service communication

---

## 🔄 CI Pipeline (GitHub Actions)
`Code Push` → `Build Docker Images` → `Push to Artifact Registry`

**Registry:**
`us-central1-docker.pkg.dev/exalate-project-492211/backend-repo`

---

## 🔁 GitOps (Argo CD + Kustomize)
* Argo CD installed via Helm (managed through Terraform)
* Auto-sync, Self-heal, and Prune enabled
* **Flow:** `Git` → `Argo CD` → `GKE`

---

## 🔐 Security Highlights
* Private GKE cluster (no public API endpoint)
* Access via bastion host using IAP
* Controlled egress using Cloud NAT
* **Workload Identity** (no static credentials)
* IAM-based access control
* Firewall rules for restricted access
* Internal-only service communication

---

## ⚡ Kubernetes Best Practices Implemented
* Resource requests and limits
* Liveness and Readiness probes
* Proper container lifecycle handling

---

## 📂 Repository Structure
```text
gcp-tf/
└── gcp-infra/
    ├── envs/dev/          # Terraform environment
    ├── modules/           # Reusable infra modules
    └── exalate/
        ├── api/           # API service
        └── backend/       # Backend service


📈 Current Status
This project represents a fully working DevOps + GitOps baseline including:
Infrastructure provisioning with Terraform
Secure private Kubernetes cluster
Workload Identity implementation
CI pipeline with GitHub Actions
GitOps deployment with Argo CD
Multi-service architecture
Tenant-aware request handling

🚧 Planned Enhancements
Replace latest with commit-based image tagging
Integrate Google Cloud Secret Manager
Introduce Kubernetes NetworkPolicies
Add observability (Prometheus + Grafana)
Improve Kustomize structure (base + overlays)

💬 Notes
This implementation focuses on core infrastructure, security posture, and deployment workflows. Additional enhancements are aligned with production best practices and can be implemented incrementally.

🤝 Feedback
Open to feedback and suggestions.
