module "gateway" {
   source = "./modules"
    compartment_id = var.compartment_id
    endpoint_type = var.gateway_endpoint_type
    subnet_id = var.subnet_id

}

