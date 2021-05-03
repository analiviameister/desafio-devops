resource "google_compute_instance" "vm_instance_cicd-01" {
  name         = "cicd-jenkins-01"
  machine_type = var.machine_types.mean
  zone          = "${var.zone_name}"
  tags = [ "ssh" ]

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
