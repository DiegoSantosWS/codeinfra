output "database_password" {
  value = digitalocean_database_user.username.password
  sensitive = true
}

output "database_uri" {
  value = digitalocean_database_cluster.postgres.uri
  sensitive = true
}