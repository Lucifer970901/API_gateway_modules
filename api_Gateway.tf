resource "oci_apigateway_gateway" "test_gateway" {
   # source = "../../infra/modules/gateway"

    compartment_id = var.compartment_id
    display_name = var.display_name
    #endpoint_type = var.endpoint_type
    subnet_id = var.subnet_id
}

module "gateway" {
    source = "."

    compartment_id = var.compartment_id
    display_name = var.display_name
    endpoint_type = var.endpoint_type
    subnet_id = var.subnet_id
}
