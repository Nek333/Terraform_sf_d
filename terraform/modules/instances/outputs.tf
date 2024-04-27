# ID инстансов-воркеров. Может быть использовано для ссылки на эти инстансы в других ресурсах.
output "worker_ids" {
  value = yandex_compute_instance.worker_instance.*.id
}

# Внешние IP-адреса инстансов-воркеров. Используются для доступа к инстансам из интернета.
output "worker_external_ips" {
  value = [for instance in yandex_compute_instance.worker_instance : instance.network_interface.0.nat_ip_address]
}

# Внутренние IP-адреса инстансов-воркеров. Используются для внутренней связи между инстансами.
output "worker_internal_ips" {
  value = [for instance in yandex_compute_instance.worker_instance : instance.network_interface.0.ip_address]
}

# Имена инстансов-воркеров, доступные из внешней сети.
output "worker_external_names" {
  value = [for instance in yandex_compute_instance.worker_instance : instance.name]
}

# Внешние IP-адреса инстансов-воркеров в формате map, где ключ - имя инстанса.
output "worker_external_ips_printable" {
  value = { for instance in yandex_compute_instance.worker_instance : instance.name => instance.network_interface.0.nat_ip_address }
}

# Внутренние IP-адреса инстансов-воркеров. Используются для внутренней связи между инстансами.
output "worker_internal_ips_printable" {
  value = { for instance in yandex_compute_instance.worker_instance : instance.name => instance.network_interface.0.nat_ip_address }
}

# ID инстансов control_pane. Может быть использовано для ссылки на эти инстансы в других ресурсах.
output "cp_ids" {
  value = yandex_compute_instance.cp_instance.*.id
}

# Внешние IP-адреса инстансов control_pane. Используются для доступа к инстансам из интернета.
output "cp_external_ips" {
  value = [for instance in yandex_compute_instance.cp_instance : instance.network_interface.0.nat_ip_address]
}

# Внутренние IP-адреса инстансов-воркеров. Используются для внутренней связи между инстансами.
output "cp_internal_ips" {
  value = [for instance in yandex_compute_instance.cp_instance : instance.network_interface.0.nat_ip_address]
}

# Имена инстансов control_pane, доступные из внешней сети.
output "cp_external_names" {
  value = [for instance in yandex_compute_instance.cp_instance : instance.name]
}

# Внешние IP-адреса инстансов control_pane в формате map, где ключ - имя инстанса.
output "cp_external_ips_printable" {
  value = { for instance in yandex_compute_instance.cp_instance : instance.name => instance.network_interface.0.nat_ip_address }
}

# ID инстансов контроля. Может быть использовано для ссылки на эти инстансы в других ресурсах.
output "srv_ids" {
  value = yandex_compute_instance.srv_instance.*.id
}

# Внешние IP-адреса инстансов контроля. Используются для доступа к инстансам из интернета.
output "srv_external_ips" {
  value = [for instance in yandex_compute_instance.srv_instance : instance.network_interface.0.nat_ip_address]
}

# Внутренние IP-адреса инстансов-воркеров. Используются для внутренней связи между инстансами.
output "srv_internal_ips" {
  value = [for instance in yandex_compute_instance.srv_instance : instance.network_interface.0.nat_ip_address]
}

# Имена инстансов контроля, доступные из внешней сети.
output "srv_external_names" {
  value = [for instance in yandex_compute_instance.srv_instance : instance.name]
}
# Внешние IP-адреса инстансов контроля в формате map, где ключ - имя инстанса.
output "srv_external_ips_printable" {
  value = { for instance in yandex_compute_instance.srv_instance : instance.name => instance.network_interface.0.nat_ip_address }
}
