terraform {
  required_providers {
    yandex  = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_dns_zone" "external_zone" {
  name        = "${var.dns_zone_name}-internal"
  description = "${var.dns_zone_description}_internal"

  zone             = var.dns_name
  public           = true
  private_networks = var.private_networks
}

resource "yandex_dns_recordset" "srv_fqdn" {
  zone_id = yandex_dns_zone.external_zone.id
  name    = "srv"
  type    = "A"
  ttl     = 300
  data    = var.srv_fqdn
  }

resource "yandex_dns_zone" "internal_zone" {
  name        = "${var.dns_zone_name}-external"
  description = "${var.dns_zone_description}_external"

  zone             = var.dns_name
  public           = false
  private_networks = var.private_networks
}

resource "yandex_dns_recordset" "vm_dns" {
  for_each = {for i, name in var.instance_names: name => var.instance_ips[i]}

  zone_id = yandex_dns_zone.internal_zone.id
  name    = "${each.key}.${var.dns_name}"
  type    = "A"
  ttl     = 300
  data    = [each.value]
  }