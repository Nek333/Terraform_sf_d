output "instance_external_ips" {
  value = concat(module.instances.worker_external_ips, module.instances.cp_external_ips, module.instances.srv_external_ips)
}

output "network_id" {
  value = module.network.network_id
}

output "subnet_id" {
  value = module.network.subnet_id
}
