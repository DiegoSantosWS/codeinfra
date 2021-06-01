resource "digitalocean_loadbalancer" "public" {
  name   = var.lb_name
  region = var.droplet_region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web[*].id
}


resource "digitalocean_domain" "default" {
  name       = var.domain_name
  ip_address = digitalocean_loadbalancer.public.ip
}
