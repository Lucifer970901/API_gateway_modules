data "local_file" "api_description_file" {
    filename = "./fieldservice_api.yaml"
}

locals {
    api_description = yamldecode(data.local_file.api_description_file.content)
}

resource "oci_apigateway_api" "api_resource" {
    compartment_id = var.compartment_id
    content = data.local_file.api_description_file.content
    display_name = local.api_description.info.title
    
}
