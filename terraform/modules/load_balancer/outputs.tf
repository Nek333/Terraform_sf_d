output "load_balancer_id" {
  description = "Идентификатор созданного сетевого балансировщика нагрузки."
  value       = yandex_lb_network_load_balancer.foo.id
}