module "gateway" {
    source = "./"

    compartment_id = var.compartment_id
    display_name = var.display_name
    endpoint_type = var.endpoint_type
    subnet_id = var.subnet_id
}

