resource "google_compute_instance" "vm_instance_balancer-01" {
  name         = "balancer-haproxy-01"
  machine_type = var.machine_types.simple
  zone          = "${var.zone_name}"
  tags = [ "ssh", "http", "https" ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync htop"

  # adicionando chaves
  metadata = {ssh-keys = "root:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    subnetwork = "${google_compute_subnetwork.private_subnet.name}"
    access_config {
    }
  }

}