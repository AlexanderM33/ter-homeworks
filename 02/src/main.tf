resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.my_resources.web.image
}
resource "yandex_compute_instance" "platform" {
  name        = "${local.project}-${local.usage}-${local.instance}-web"
  platform_id = var.my_resources.web.platform
  resources {
    cores         = var.my_resources.web.cores
    memory        = var.my_resources.web.memory
    core_fraction = var.my_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.my_resources.web.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.my_resources.web.nat
  }

  metadata = {
    serial-port-enable = var.vms_ssh.serial-port-enable
    ssh-keys           = "${var.vms_ssh_user}:${file(var.vms_ssh.pub_key)}"
  }

}
#~~~~~~~~~~~~~~~~~~adding database~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "yandex_compute_instance" "DB" {
  name        = "${local.project}-${local.usage}-${local.instance}-db"
  platform_id = var.my_resources.db.platform
  resources {
    cores         = var.my_resources.db.cores
    memory        = var.my_resources.db.memory
    core_fraction = var.my_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.my_resources.db.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.my_resources.db.nat
  }

  metadata = {
    serial-port-enable = var.vms_ssh.serial-port-enable
    ssh-keys           = "${var.vms_ssh_user}:${file(var.vms_ssh.pub_key)}"
  }

}
