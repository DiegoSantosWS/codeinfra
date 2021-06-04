output "ip_do_droplet" {
  value = digitalocean_droplet.web[*].ipv4_address
}

output "load_balancer_ip" {
  value = digitalocean_loadbalancer.public.ip
}