

variable "project" {
  description = "value"
  type        = string
  default = "openCMS-nginx-postgres"
}

variable "profile" {
    description = "AWS profile "
    type = string
    default = "terraform"
}

variable "sg_ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 22, 443, 5432]

}



variable "sg_egress_ports" {
  type = list(number)
  description = "list of egress ports"
  default = [ 80, 22, 443, 5432 ] 
}



variable "env" {
  type = string
  description = "environment to deploy"
}


variable "user_data_file" {
  //type = string
  //default = file("../../modules/instances/userdata.tpl")
}



 variable "env" {
    description = "provisioned environment"
    type = string
}





