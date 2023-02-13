data "local_file" "api_description_file" {
    filename = "./openapi.yaml"
}

locals {
    api_description = yamldecode(data.local_file.api_description_file.content)
}

### Compartment
variable "compartment_id" {
    type = string
}
resource "oci_apigateway_api" "api_resource" {
    for_each = fileset("${path.module}/openapi", "*.yaml")
    compartment_id = var.compartment_id
    content = file("${path.module}/openapi/${each.value}")
    display_name = yamldecode(file("${path.module}/openapi/${each.value}")).info.title
   
}
