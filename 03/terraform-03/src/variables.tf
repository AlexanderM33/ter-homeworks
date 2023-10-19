###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_resources" { 
  type = map(number)
  default = {
    cores         = 2,
    memory        = 1,
    core_fraction = 5
  }
  description = "tuning"
}

variable "vm_platforms" {
  type    = map(string)
  default = {
    v1 = "standard-v1"
    v2 = "standart-v2"
  }
  description = "Platforms name"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
variable "public_key" {
  type        = string
  description = "ssh ed25519 public key"
  default = ""
}


#list of resources
variable "resources_list" {
  type = list(object(
    {
      vm_name = string
      cpu     = number
      ram     = number
      disk    = number
  }))
  default = [
    {
      vm_name = "yandex_compute_image.vm.name"
      cpu     = 2
      ram     = 2
      disk    = 10
    }
  ]
}



variable "secondary_disk_list" {
  type = list(object(
    {
      disk_id = string
  }))
  default = [{
    disk_id = "yandex_compute_disk.disks.name.id"
  }]
}

variable "disk" {
  description = "Create new disk"
  type = map
  default = {
    name = "new-disk"
    type = "network-hdd"
    zone = "ru-central1-a"
    size = 1
  }
}