
resource "oci_apigateway_gateway" "test_gateway" {
    #Required
    compartment_id = var.compartment_id
    endpoint_type = var.gateway_endpoint_type
    subnet_id = oci_core_subnet.test_subnet.id
}
