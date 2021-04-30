resource "google_compute_network" "vpc_network" {
  name                    = "desafio-network"
  auto_create_subnetworks = "true"
}