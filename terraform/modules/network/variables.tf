# Имя создаваемой виртуальной частной сети (VPC) в Yandex Cloud.
variable "network_name" {
  description = "Имя создаваемой сети в Yandex Cloud"
  type        = string
}

# Имя создаваемой подсети в указанной VPC.
variable "subnet_name" {
  description = "Имя создаваемой подсети в VPC"
  type        = string
}

# Зона доступности, в которой будет создана подсеть.
variable "zone" {
  description = "Зона доступности для создаваемой подсети"
  type        = string
}

# CIDR блок IP-адресов для подсети.
variable "cidr_block" {
  description = "CIDR блок для подсети, определяющий диапазон доступных IP-адресов"
  type        = string
}
