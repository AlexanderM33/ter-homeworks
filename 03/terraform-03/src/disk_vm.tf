resource "yandex_compute_disk" "disk" {
  count = 3
  name  = "${var.disk.name}-${count.index}"
  type  = var.disk.type
  zone  = var.default_zone
  size  = var.disk.size
}

resource "yandex_compute_instance" "mount-disk-vm" {

  depends_on = [ yandex_compute_disk.disk ]

  name        = "mount-disk-vm"
  platform_id = var.vm_platforms.v1

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2204-lts.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.disk[*].id)
    content {
      disk_id = secondary_disk.key
    }
  }

scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ssh_id_rsa
  } 
}