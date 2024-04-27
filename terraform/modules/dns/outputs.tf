# ID созданной DNS зоны в Yandex Cloud.
output "dns_internal_zone_id" {
  description = "ID созданной внешней DNS зоны в Yandex Cloud"
  value       = yandex_dns_zone.external_zone.id
}

# ID созданной DNS зоны в Yandex Cloud.
output "dns_external_zone_id" {
  description = "ID созданной внутренней DNS зоны в Yandex Cloud"
  value       = yandex_dns_zone.internal_zone.id
}

# Полные доменные имена (FQDN) созданных записей для инстансов.
output "fqdn_instance_names" {
  description = "Полные доменные имена созданных A записей для инстансов"
  value       = [for name in var.instance_names : "${name}.${var.dns_name}"]
}

# FQDN для CNAME записи 'web'.
output "web_fqdn" {
  description = "Полное доменное имя для CNAME записи 'web'"
  value       = "web.${var.dns_name}"
}
