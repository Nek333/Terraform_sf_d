terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~>0.65.0"
    }
  }
}

provider "yandex" {
  token = "y0_AgAAAAAY7WZeAATuwQAAAAECc0elAADIUMtvJgxB8b-qUYqaxfPa56jaQw"
  cloud_id = "b1gko7otatt45nppomok"
  folder_id = "b1g4q5tlm30vjh648j62"
  zone      = "ru-central1-a"
}

module "network" {
  source       = "./modules/network"
  network_name = "sf-diplom-network"
  subnet_name  = "sf-diplom-subnet"
  zone         = "ru-central1-b"
  cidr_block   = "10.0.0.0/24"
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  target_group_name   = "sf-target-group"
  region_id           = "ru-central1"
  targets             = [for ip in module.instances.worker_internal_ips : {
                              subnet_id = module.network.subnet_id
                              address   = ip
                          }]
  load_balancer_name  = "sf-load-balancer"
  listener_port       = 8080
  health_check_port   = 3003
  health_check_path   = "/ping"
  depends_on          = [module.instances, module.network]
}

module "instances" {
  source                 = "./modules/instances"
  subnet_id              = module.network.subnet_id
  zone                   = "ru-central1-b"
  image_family           = "ubuntu-2004-lts"
  worker_instance_count  = 1
  cp_instance_count      = 1
  srv_instance_count     = 1
  worker_instance_name   = "sf-dip-app"
  cp_instance_name       = "sf-dip-master"
  srv_instance_name      = "sf-dip-srv"
  worker_cores           = 2
  cp_cores               = 2
  srv_cores              = 2
  worker_memory          = 2
  cp_memory              = 4
  srv_memory             = 4
  disk-size              = 10
  worker_cloud-init_path = "init-files/cloud-init-app.yaml"
  cp_cloud-init_path     = "init-files/cloud-init-master.yaml"
  srv_cloud-init_path    = "init-files/cloud-init-srv.yaml"
}

module "dns" {
  source                = "./modules/dns"
  private_networks      = [module.network.network_id]
  instance_ips          = concat(module.instances.worker_internal_ips, module.instances.cp_internal_ips, module.instances.srv_internal_ips)
  instance_names        = concat(module.instances.worker_external_names, module.instances.cp_external_names, module.instances.srv_external_names)
  dns_name              = "skillfactory-borovetskiy.ru."
  dns_zone_name         = "skillfactory-borovetskiy-ru"
  srv_fqdn              = module.instances.srv_external_ips
  dns_zone_description  = "skillfactory-borovetskiy-ru"
  depends_on = [module.instances, module.network]
}
