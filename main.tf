variable "do_token" {
  type        = string
  description = "This variable with access token"
}


variable "droplet_image" {
  type = string
}


provider "digitalocean" {
  token = var.do_token
}

terraform {
  required_version = ">= 0.15.4"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.9.0"
    }
  }
}

module "webserver" {
  source   = "./webserver"
  do_token = var.do_token
}