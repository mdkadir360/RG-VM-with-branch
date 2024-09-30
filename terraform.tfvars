rgs = {
  rg1 = {
    name     = "kadir-test-rg"
    location = "east us"
  }

}
storage = {

    storage1={

         name                     = "kadir-test-storage"
  resource_group_name      = "kadir-test-rg"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "LRS"
    }
}

con = {
    con1= {

        name                  = "kadir-test-container"
        storage_account_name  = "kadir-test-storage"
       container_access_type = "private"
    }
}



vnet = {
  vnet1 = {
    name                = "kadir-test-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "east us"
    resource_group_name = "kadir-test-rg"
  }
 
}
subnet = {
  subnet1 = {
    name                 = "kadir-test-subnet"
    resource_group_name  = "kadir-test-rg"
    virtual_network_name = "kadir-test-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
pip = {
    pip1 = {
      name                = "frontend-testpip1"
      resource_group_name = "kadir-test-rg"
      location            = "east us"
      allocation_method   = "Static"
  sku                 = "Basic"
    }
}
nic = {
  nic1 = {
    name                 = "frontend-testnic1"
    location             = "east us"
    resource_group_name  = "kadir-test-rg"
    virtual_network_name = "kadir-test-vnet"
    subnetname           = "kadir-test-subnet"
     ipname               = "frontend-testpip1"
  }
}
nsg = {
  nsg1 = {
    name                = "nsgtestrule"
    location            = "east us"
    resource_group_name = "kadir-test-rg"
  }
  
}

security = {
  rule1 = {
    name                       = "ssh_access"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 22
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  rule2 = {
    name                       = "http_access"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 80
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

}

associationm = {
  association1 = {
    name                 = "kadirtestnsg"
    nsgname              = "nsgtestrule"
    resource_group_name  = "kadir-test-rg"
    subnatname           = "kadir-test-subnet"
    virtual_network_name = "kadir-test-vnet"

  }
}

vm = {
  vm01 = {
    name                = "kadirfrontend-testvm1"
    location            = "east us"
    resource_group_name = "kadir-test-rg"
    nicname             = "frontend-testnic1"
  }
}
