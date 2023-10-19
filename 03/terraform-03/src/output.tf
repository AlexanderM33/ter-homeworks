
output "foreach_vms_output" {
  description = "name instance"
  value = <<EOT
   [
    %{~ for value in yandex_compute_instance.web ~}
    { 
     "name" = ${ value.name }
     "id" = ${ value.id }
     "fqdn" = ${ value.fqdn }
    },
    %{~ endfor ~}
    %{~ for value in yandex_compute_instance.vm ~}
    { 
     "name" = ${ value.name }
     "id" = ${ value.id }
     "fqdn" = ${ value.fqdn}
    },
    %{~ endfor ~}
    {
     "name" = ${yandex_compute_instance.mount-disk-vm.name}
     "id"   = ${yandex_compute_instance.mount-disk-vm.id}
     "fqdn" = ${yandex_compute_instance.mount-disk-vm.fqdn}
    }
   ]
  EOT
}