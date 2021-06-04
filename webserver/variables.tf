variable "do_token" {
  type        = string
  description = "This variable with access token"
}

variable "droplet_region" {
  type        = string
  description = "Base image from region droplet"
  default     = "nyc1"
}

variable "droplet_image" {
  type        = string
  description = "Base image from droplet"
  default     = "ubuntu-20-04-x64"
}

variable "droplet_size" {
  type        = string
  description = "Base image from size droplet"
  default     = "s-1vcpu-1gb"
}

variable "droplet_environmets" {
  type        = list(string)
  description = "Base image from size droplet"
  default     = ["develop"]
}

variable "droplet_sshKeys" {
  type        = list(string)
  description = "Base image from list keys to access the droplet"
  default     = ["09:ad:ba:80:f0:f2:50:e5:59:96:65:04:95:59:e1:d3"]
}

variable "lb_name" {
  type        = string
  description = "name load balancer"
  default     = "ws-blog"
}


variable "firewall_name" {
  type        = string
  description = "name of firewall"
  default     = "braum"
}

variable "troubleshooting" {
  type        = bool
  description = "liberar acesso ao droplets na porta 22"
  default     = true
}

variable "domain_name" {
  type        = string
  description = "domain name host"
  default     = "diegosantosws.com.br"
}

variable "environment" {
  type        = string
  description = "environment name host"
  default     = "prod"
}

