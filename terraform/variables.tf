

variable "project" {
  description = "value"
  type        = string
  default = "openCMS-project"
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
  default = "dev"
}


//variable "user_data_file" {
 // type = string
  //default = file("./userdata.tpl")
//}





