#Generate SSH
resource "tls_private_key" "bastion_ssh" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "azurerm_public_ip" "bastion_ip" {
    name = "bastion-public-ip"
    resource_group_name = var.resource_group_name
    location = var.location
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_network_interface" "bastion_nic" {
    name = "bastion-nic"
    location = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name = "internal"
        subnet_id = var.public_subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.bastion_ip.id
    }
}

resource "azurerm_linux_virtual_machine" "bastion" {
    name = "bastion-vm"
    resource_group_name = var.resource_group_name
    location = var.location
    size = "Standard_B1s"

    admin_username = "azureuser"
    network_interface_ids = [
        azurerm_network_interface.bastion_nic.id
    ]

    admin_ssh_key {
        username = "azureuser"
        public_key = tls_private_key.bastion_ssh.public_key_openssh
    }

    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer = "0001-com-ubuntu-server-focal"
        sku = "20_04-lts"
        version = "latest"
    }

    identity {
        type = "SystemAssigned"
    }
}

resource "azurerm_network_interface" "private_nic" {
    name = "private-vm-nic"
    location = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name = "internal"
        subnet_id = var.private_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "private_vm" {
    name = "private-vm"
    resource_group_name = var.resource_group_name
    location = var.location
    size = "Standard_B1s"

    admin_username = "azureuser"
    network_interface_ids = [
        azurerm_network_interface.private_nic.id
    ]

    admin_ssh_key {
        username = "azureuser"
        public_key = tls_private_key.bastion_ssh.public_key_openssh
    }

    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer = "0001-com-ubuntu-server-focal"
        sku = "20_04-lts"
        version = "latest"
    }

    identity {
        type = "SystemAssigned"
    }
}