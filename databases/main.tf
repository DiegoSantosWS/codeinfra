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

resource "digitalocean_database_cluster" "postgres" {
  name       = var.pg_cluster_name
  region     = "nyc1"
  engine     = "pg"
  version    = var.pg_cluster_version
  size       = var.pg_cluster_size
  node_count = var.pg_nodes_count
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = var.database_name
}

resource "digitalocean_database_user" "username" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = var.database_username
}
