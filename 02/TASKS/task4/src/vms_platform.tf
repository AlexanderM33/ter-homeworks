
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

#~~~~~~~~~~~~~~~~DATABASE~~~~~~~~~~~~~~~~~~~~~~~~~~~~

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name for DB"
}

variable "vm_db_image" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "DB image name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform"
}

variable "vm_db_cores" {
  type        = number
  default     = "2"
  description = "DB cores"
}

variable "vm_db_memory" {
  type        = number
  default     = "2"
  description = "memory DB"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = "20"
  description = "DB core fraction"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = "true"
  description = "unknowm"
}

variable "vm_db_nat" {
  type        = bool
  default     = "true" #or false
  description = "DB NAT"
}

variable "vm_db_serial_port" {
  type        = number
  default     = "1"
  description = "db serial port"
}
