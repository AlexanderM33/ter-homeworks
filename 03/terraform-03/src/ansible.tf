resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { 
       web = yandex_compute_instance.web,
       vm = yandex_compute_instance.vm,
       mount-disk-vm = yandex_compute_instance.mount-disk-vm
    } 
  )

  filename = "${abspath(path.module)}/inventory"
} 