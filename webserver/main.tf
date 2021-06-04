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

resource "digitalocean_droplet" "web" {
  image    = var.droplet_image
  name     = var.droplet_environmets[count.index]
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = var.droplet_sshKeys
  tags = [ "webserver" ]
  
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      ssh_keys,
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com | sh"
    ]

    connection {
      type = "ssh"
      user = "root"
      host = self.ipv4_address
    }
  }
  count = length(var.droplet_environmets)
}