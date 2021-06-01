
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
      "docker run -d -p 80:8080 -e DATABASE_URL=${digitalocean_database_cluster.postgres.uri} -e ENVIRONMENT=${var.environment} igordcsouza/hc-terraform"
    ]

    connection {
      type = "ssh"
      user = "root"
      host = self.ipv4_address
    }
  }
  count = length(var.droplet_environmets)
}



