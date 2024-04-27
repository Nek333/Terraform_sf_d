# ID созданной виртуальной частной сети (VPC) в Yandex Cloud.
output "network_id" {
  description = "ID созданной сети в Yandex Cloud"
  value       = yandex_vpc_network.network.id
}

# ID созданной подсети в указанной VPC.
output "subnet_id" {
  description = "ID созданной подсети в сети"
  value       = yandex_vpc_subnet.subnet.id
}