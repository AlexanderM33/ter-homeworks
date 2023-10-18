output "instance_external_ip" {
  value = tomap({
    "${local.project}-${local.usage}-${local.instance}-web" = ([yandex_compute_instance.platform.network_interface[0].nat_ip_address]),
    "${local.project}-${local.usage}-${local.instance}-db"  = ([yandex_compute_instance.DB.network_interface[0].nat_ip_address])
  })
  description = "output external ip"
}
