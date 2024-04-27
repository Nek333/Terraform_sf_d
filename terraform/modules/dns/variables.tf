# Список ID приватных сетей, которые будут иметь доступ к DNS зоне.
variable "private_networks" {
  description = "Список ID приватных сетей для доступа к DNS зоне"
  type        = list(string)
}

# Список IP-адресов инстансов для создания A записей в DNS.
variable "instance_ips" {
  description = "Список IP-адресов инстансов для A записей"
  type        = list(string)
}

# Список имен инстансов, соответствующих IP-адресам, для формирования полных доменных имен.
variable "instance_names" {
  description = "Список имен инстансов для создания A записей"
  type        = list(string)
}

# Доменное имя для DNS зоны.
variable "dns_name" {
  description = "Доменное имя для DNS зоны"
  type        = string
}

# Имя DNS зоны в Yandex Cloud.
variable "dns_zone_name" {
  description = "Имя DNS зоны в Yandex Cloud"
  type        = string
}

# Описание DNS зоны.
variable "dns_zone_description" {
  description = "Описание DNS зоны"
  type        = string
}

# Адрес урпавляющего сервера.
variable "srv_fqdn" {
  description = "Описание DNS зоны"
  type        = list(string)
}