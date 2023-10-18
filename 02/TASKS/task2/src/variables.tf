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
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM0LzrwzAXpYNbzSVxrmEthMFDvNwFMVXNF/dSz1P3dN eddsa-key-20230928"
  description = "ssh-keygen -t ed25519"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "web name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform type"
}

variable "vm_web_instance" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "image name"
}

variable "vm_web_cores" {
  type        = number
  default     = "2"
  description = "cores"
}

variable "vm_web_memory" {
  type        = number
  default     = "1"
  description = "memory"
}
variable "vm_web_core_fraction" {
  type        = number
  default     = "5"
  description = "core_fraction"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = "true"
  description = "preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = "true"
  description = "NAT"
}

variable "vm_web_serial_port" {
  type        = number
  default     = "1"
  description = "serial_port"
}


