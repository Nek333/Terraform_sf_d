terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

data "yandex_compute_image" "vm_image" {
  family = var.image_family
}

resource "yandex_compute_instance" "worker_instance" {
  count = var.worker_instance_count

  name        = "${var.worker_instance_name}-${count.index}"
  zone        = var.zone
  hostname    = "${var.worker_instance_name}-${count.index}"
  platform_id = "standard-v1"

  resources {
    cores  = var.worker_cores
    memory = var.worker_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.vm_image.id
      size = 20
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file(var.worker_cloud-init_path)}"

  }
}

resource "yandex_compute_instance" "cp_instance" {
  count = var.cp_instance_count

  name        = "${var.cp_instance_name}-${count.index}"
  zone        = var.zone
  hostname    = "${var.cp_instance_name}-${count.index}"
  platform_id = "standard-v1"

  resources {
    cores  = var.cp_cores
    memory = var.cp_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.vm_image.id
      size = 55
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file(var.cp_cloud-init_path)}"

  }
}

resource "yandex_compute_instance" "srv_instance" {
  count = var.srv_instance_count

  name        = "${var.srv_instance_name}-${count.index}"
  zone        = var.zone
  hostname    = "${var.srv_instance_name}-${count.index}"
  platform_id = "standard-v1"

  resources {
    cores  = var.srv_cores
    memory = var.srv_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.vm_image.id
      size = 15
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file(var.srv_cloud-init_path)}"

  }
}
