resource "oci_apigateway_gateway" "gateway" {
   
    compartment_id = var.compartment_id
    gateway_endpoint_type = var.gateway_endpoint_type
    subnet_id = var.subnet_id

}

