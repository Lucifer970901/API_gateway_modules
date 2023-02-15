data "local_file" "api_description_file" {
    filename = "./data/swagger.yaml"
}

locals {
    api_description = yamldecode(data.local_file.api_description_file.content)
}

resource "oci_apigateway_api" "api_resource" {
    compartment_id = var.compartment_id
    content = data.local_file.api_description_file.content
    display_name = local.api_description.info.title
}  

'''resource "oci_apigateway_api" "api_resource" {
    for_each = fileset("${path.module}/openapi", "*.yaml")
    compartment_id = var.compartment_id
    content = file("${path.module}/openapi/${each.value}")
    display_name = yamldecode(file("${path.module}/openapi/${each.value}")).info.title
   
}'''
