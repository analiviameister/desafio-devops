variable "project_name" {
    type = string
    default = "desafio-project"
}

variable "company_name" {
    type = string
    default = "meister"
}

variable "environment" {
    type = string
    default = "gcp"
}

variable "region_name" {
    type = string
    default = "us-east1"
}

variable "zone_name" {
    type = string
    default = "us-east1-c"
}

variable "ue1_private_subnet" {
        default = "10.15.1.0/24"
}

variable "ue1_public_subnet" {
        default = "192.168.15.0/24"
}
variable "machine_types" {
    type = map
    default = {
        simple = "f1-micro" // 1x1
        mean = "e2-highcpu-4" // 4x4
        powerfull = "e2-highcpu-8" // 8x8
    }
}

variable "machine_types_kubernetes" {
    type = map
    default = {
        master = "e2-highcpu-4"
        worker = "e2-highcpu-4"
        etcd = "e2-highcpu-8"
    }
}