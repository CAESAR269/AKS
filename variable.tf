variable "name" {
  type    = map(string)
  default = {
    default = "default"
    Dev = "Dev"
  }
}
variable "region" {
  type    = string
  default = "east us"
}
variable "clustername" {
  type    = string
  default = "kubecluster"
}
variable "dns_prefix" {
  type    = string
  default = "kubecluster"
}
variable "pool_name" {
  type    = string
  default = "default"
}
variable "node_count" {
  type = map(number)
  default = {
    default = 1
    Dev     = 2

  }
}
variable "vm_size" {
  type    = string
  default = "Standard_B2S"
}
