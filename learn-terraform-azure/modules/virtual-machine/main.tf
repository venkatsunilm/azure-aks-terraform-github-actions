resource "azurerm_windows_virtual_machine" "vm" {
    name                  = var.vmname
    resource_group_name   = var.resource_group_name
    location              = var.location
    size                  = var.vm_size
    admin_username        = var.admin_usename
    admin_password        = var.admin_password
    network_interface_ids = var.network_interface_ids
    os_disk {
        name                    = "${var.vmname}-os-disk-01"
        caching                 = "ReadWrite"
        storage_account_type    = var.os_disk_type
    }
    source_image_reference {
        publisher = var.image_publisher
        offer     = var.image_offer
        sku       = var.image_sku
        version   = "latest"
    }
}