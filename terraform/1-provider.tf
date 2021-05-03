terraform {

  required_version = ">= 0.15.1"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file("credentials/desafio-project-8274ac718369.json")
  project = var.project_name
  region = var.region_name
}