variable "project_id" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zones" {
  type    = list(string)
  default = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "pods_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "services_cidr" {
  type    = string
  default = "10.30.0.0/20"
}

variable "master_cidr" {
  type    = string
  default = "172.16.0.0/28"
}

variable "master_authorized_networks" {
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []
}

variable "cluster_name" {
  type    = string
  default = "exalate-gke"
}

variable "topic_name" {
  type    = string
  default = "integration-events"
}

variable "dlq_topic_name" {
  type    = string
  default = "integration-events-dlq"
}

variable "subscription_name" {
  type    = string
  default = "integration-worker-sub"
}
