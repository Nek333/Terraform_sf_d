terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_lb_target_group" "foo" {
  name      = var.target_group_name
  region_id = var.region_id

  dynamic "target" {
    for_each = var.targets
    content {
      subnet_id = target.value.subnet_id
      address   = target.value.address
    }
  }
}

resource "yandex_lb_network_load_balancer" "foo" {
  name = var.load_balancer_name

  listener {
    name = "my-listener"
    port = var.listener_port
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.foo.id

    healthcheck {
      name         = "http"
      http_options {
        port = var.health_check_port
        path = var.health_check_path
      }
    }
  }
}
