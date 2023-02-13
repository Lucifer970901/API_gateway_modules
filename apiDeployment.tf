resource "oci_apigateway_deployment" "fieldservice_deployment" {
    #Required
    compartment_id = var.compartment_id
    gateway_id = module.gateway.gateway_id
    path_prefix = local.api_description.basePath
    specification {

        #Optional
        logging_policies {

            #Optional
            access_log {

                #Optional
                is_enabled = true
            }
            execution_log {

                #Optional
                is_enabled = true
                log_level = var.logging_level
            }
        }
        request_policies {

#         rate_limiting {
#            # Required
#            rate_in_requests_per_second = "${var.deployment_specification_request_policies_rate_limiting_rate_in_requests_per_second}"
#            rate_key = "${var.deployment_specification_request_policies_rate_limiting_rate_key}"
#            }
        }
        routes {
            #Required
            backend {
                #Required
                type = "ORACLE_FUNCTIONS_BACKEND"

                #Optional
                function_id = var.function_id
                connect_timeout_in_seconds = "5"
                read_timeout_in_seconds = "5"
                send_timeout_in_seconds = "5"
            }
            path = "/tickets"

            #Optional
            logging_policies {

                #Optional
                access_log {

                    #Optional
                    is_enabled = true
                }
                execution_log {

                    #Optional
                    is_enabled = true
                    log_level = var.logging_level
                }
            }
            methods = ["GET"]
        }
    }
    display_name = local.api_description.info.title
    
}

