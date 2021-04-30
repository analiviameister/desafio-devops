resource "google_compute_instance" "vm_instance_01" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  # adicionando pacotes na instancia
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  # adicionando chaves
  metadata = {ssh-keys = "INSERT_USERNAME:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }

}

resource "google_compute_instance" "vm_instance_02" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  # adicionando pacotes na instancia
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  # adicionando chaves
  metadata = {ssh-keys = "INSERT_USERNAME:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}



resource "google_compute_instance" "vm_instance_03" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  # adicionando pacotes na instancia
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  # adicionando chaves
  metadata = {ssh-keys = "INSERT_USERNAME:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
} 