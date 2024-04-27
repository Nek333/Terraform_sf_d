variable "target_group_name" {
  description = "Имя группы целевых объектов."
  type        = string
}

variable "region_id" {
  description = "Идентификатор региона, в котором создается группа целевых объектов."
  type        = string
}

variable "targets" {
  description = "Список целевых инстансов для группы целевых объектов."
  type = list(object({
    subnet_id = string
    address   = string
  }))
}

variable "load_balancer_name" {
  description = "Имя сетевого балансировщика нагрузки."
  type        = string
}

variable "listener_port" {
  description = "Порт, на котором слушает балансировщик нагрузки."
  type        = number
}

variable "health_check_port" {
  description = "Порт, используемый для проверки работоспособности."
  type        = number
}

variable "health_check_path" {
  description = "Путь, используемый для проверки работоспособности."
  type        = string
}
