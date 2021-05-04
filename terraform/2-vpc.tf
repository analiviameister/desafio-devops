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
    "${var.ue1_public_subnet}",
    "10.15.1.0/32"
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

resource "google_compute_firewall" "allow-kubernetes-dashboard" {
  name    = "${var.company_name}-fw-allow-kubernetes-dashboard"
  network = "${google_compute_network.vpc.name}"
  
  allow {
    protocol = "tcp"
    ports    = ["31000"]
  }

  target_tags = ["k8s"]

}

resource "google_compute_firewall" "allow-https" {
  name    = "${var.company_name}-fw-allow-https"
  network = "${google_compute_network.vpc.name}"
  
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["https"] 
}