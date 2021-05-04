#############################
#                           #
#      k8s master nodes     #     
#                           #
#############################

resource "google_compute_instance" "vm_instance_kubernetes-master-node-01" {
  name         = "kubernetes-master-node-01"
  machine_type = var.machine_types_kubernetes.master
  zone          = "${var.zone_name}"
  tags = [ "ssh", "k8s", "https" ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"

  # adicionando chaves
  metadata = {ssh-keys = "root:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    subnetwork = "${google_compute_subnetwork.private_subnet.name}"
    access_config {
    }
  }

}


#############################
#                           #
#      k8s worker nodes     #     
#                           #
#############################

resource "google_compute_instance" "vm_instance_kubernetes-worker-node-01" {
  name         = "kubernetes-worker-node-01"
  machine_type = var.machine_types_kubernetes.worker
  zone          = "${var.zone_name}"
  tags = [ "ssh", "k8s" ]

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