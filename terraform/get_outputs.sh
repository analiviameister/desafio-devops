#/bin/bash

M_INSTANCES="public_ip_vm_instance_kubernetes-worker-node-01 public_ip_vm_instance_kubernetes-master-node-01 public_ip_vm_instance_balancer-01 public_ip_vm_instance_registry-01 public_ip_vm_instance_cicd-01 public_ip_vm_instance_monitoring-01 public_ip_vm_instance_monitoring-02"

for M_INSTANCE in $M_INSTANCES
do
    terraform output -json  $M_INSTANCE | jq 'values[0] [0]' --raw-output > outputs/$M_INSTANCE.txt

done