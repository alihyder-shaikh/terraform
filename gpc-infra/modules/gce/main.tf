resource "google_compute_instance" "bastion" {
  name         = var.name
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  tags = ["bastion"]
}
