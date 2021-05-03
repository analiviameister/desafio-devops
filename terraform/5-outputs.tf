
output "private_ip_vm_instance_monitoring-02" {
    value = ["${google_compute_instance.vm_instance_monitoring-02.*.network_interface.0.network_ip}"]
}

output "public_ip_vm_instance_monitoring-02" {
   value = ["${google_compute_instance.vm_instance_monitoring-02.*.network_interface.0.access_config.0.nat_ip}"]
}

output "public_ip_vm_instance_kubernetes-master-node-01" {
   value = ["${google_compute_instance.vm_instance_kubernetes-master-node-01.*.network_interface.0.access_config.0.nat_ip}"]
}

output "public_ip_vm_instance_kubernetes-worker-node-01" {
   value = ["${google_compute_instance.vm_instance_kubernetes-worker-node-01.*.network_interface.0.access_config.0.nat_ip}"]
}

output "public_ip_vm_instance_balancer-01" {
   value = ["${google_compute_instance.vm_instance_balancer-01.*.network_interface.0.access_config.0.nat_ip}"]
}

output "public_ip_vm_instance_registry-01" {
   value = ["${google_compute_instance.vm_instance_registry-01.*.network_interface.0.access_config.0.nat_ip}"]
}

output "public_ip_vm_instance_cicd-01" {
   value = ["${google_compute_instance.vm_instance_cicd-01.*.network_interface.0.access_config.0.nat_ip}"]
}

output "public_ip_vm_instance_monitoring-01" {
   value = ["${google_compute_instance.vm_instance_monitoring-01.*.network_interface.0.access_config.0.nat_ip}"]
}
