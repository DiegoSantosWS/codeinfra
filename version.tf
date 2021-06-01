terraform {
  required_version = ">= 0.15.4"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.9.0"
    }
  }
}
