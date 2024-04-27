# Зона доступности для создаваемых инстансов. 
# Используется для определения физического расположения серверов.
variable "zone" {
  description = "Зона доступности для инстанса"
  type        = string
}

# ID подсети, к которой будут подключены инстансы. 
# Подсеть должна быть предварительно создана в облаке.
variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

# Семейство образа, из которого будут созданы инстансы. 
# Указывает на базовую операционную систему инстансов.
variable "image_family" {
  description = "Семейство образа для инстанса"
  type        = string
}

##Создание кластера воркеров
# Количество инстансов-воркеров, которые будут созданы.
variable "worker_instance_count" {
  description = "Количество создаваемых инстансов"
  type        = number
}

# Базовое имя для инстансов-воркеров. 
variable "worker_instance_name" {
  description = "Имя инстанса"
  type        = string
}

# Путь к файлу cloud-init для настройки инстансов-воркеров.
variable "worker_cloud-init_path" {
  description = "Путь к файлу cloud-init для воркеров"
  type        = string
}

# Количество ядер CPU для каждого инстанса-воркера.
variable "worker_cores" {
  description = "Количество CPU ядер для инстанса"
  type        = number
}

# Количество оперативной памяти (в ГБ) для каждого инстанса-воркера.
variable "worker_memory" {
  description = "Количество памяти для инстанса (в ГБ)"
  type        = number
}

##Создание control_pane
# Количество инстансов control_pane, которые будут созданы.
variable "cp_instance_count" {
  description = "Количество создаваемых инстансов"
  type        = number
}

# Базовое имя для инстансов control_pane.
variable "cp_instance_name" {
  description = "Имя инстанса"
  type        = string
}

# Путь к файлу cloud-init для настройки инстансов control_pane.
variable "cp_cloud-init_path" {
  description = "Путь к публичному SSH ключу"
  type        = string
}

# Количество ядер CPU для каждого инстанса control_pane.
variable "cp_cores" {
  description = "Количество CPU ядер для инстанса"
  type        = number
}

# Количество оперативной памяти (в ГБ) для каждого инстанса control_pane.
variable "cp_memory" {
  description = "Количество памяти для инстанса (в ГБ)"
  type        = number
}

# Размер примонтирвоанного диска (в ГБ).
variable "disk-size" {
  description = "Size of the boot disk in GB"
  type        = string
}

##Создание сервера управления
# Количество инстансов control_pane, которые будут созданы.
variable "srv_instance_count" {
  description = "Количество создаваемых инстансов"
  type        = number
}

# Базовое имя для инстансов контроля.
variable "srv_instance_name" {
  description = "Имя инстанса"
  type        = string
}

# Путь к файлу cloud-init для настройки инстансов контроля.
variable "srv_cloud-init_path" {
  description = "Путь к публичному SSH ключу"
  type        = string
}

# Количество ядер CPU для каждого инстанса контроля.
variable "srv_cores" {
  description = "Количество CPU ядер для инстанса"
  type        = number
}

# Количество оперативной памяти (в ГБ) для каждого инстанса контроля.
variable "srv_memory" {
  description = "Количество памяти для инстанса (в ГБ)"
  type        = number
}