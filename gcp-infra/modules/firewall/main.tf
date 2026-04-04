resource "google_compute_firewall" "iap_ssh" {
  name    = "${var.name}-allow-iap-ssh"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"] # IAP

  target_tags = ["bastion"]
}
