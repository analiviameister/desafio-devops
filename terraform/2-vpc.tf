resource "google_compute_network" "vpc" {
  name = "desafio-network"
  auto_create_subnetworks = "false"
  routing_mode = "GLOBAL"
}

resource "google_compute_firewall" "allow_internal" {

  name = "${var.company_name}-fw-allow-internal"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports = ["0-65535"]
  }

  source_ranges = [ 
    "${var.ue1_private_subnet}",
    "${var.ue1_public_subnet}"
  ]
}

resource "google_compute_firewall" "allow-http" {
  name    = "${var.company_name}-fw-allow-http"
  network = "${google_compute_network.vpc.name}"
  
  allow {
    protocol = "tcp"
    ports    = ["80-81"]
  }
  target_tags = ["http"] 
}
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.company_name}-fw-allow-ssh"
  network = "${google_compute_network.vpc.name}"
  
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ssh"]

}

