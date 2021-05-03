resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.company_name}-${var.region_name}-pub-net"
  ip_cidr_range = "${var.ue1_public_subnet}"
  network       = google_compute_network.vpc.id
  region        = "${var.region_name}"
}

resource "google_compute_subnetwork" "private_subnet" {
  name          =  "${var.company_name}-${var.region_name}-priv-net"
  ip_cidr_range = "${var.ue1_private_subnet}"
  network       = google_compute_network.vpc.id
  region        = "${var.region_name}"
}