variable "do_token" {
  type        = string
  description = "This variable with access token"
}

variable "pg_cluster_name" {
  type        = string
  description = "name name from cluster the database"
  default     = "postgres-cluster"
}

variable "pg_cluster_version" {
  type        = string
  description = "version"
  default     = "12"
}

variable "pg_cluster_size" {
  type        = string
  description = "size"
  default     = "db-s-1vcpu-1gb"
}


variable "pg_nodes_count" {
  type        = number
  description = "qtd nodes"
  default     = 1
}

variable "database_name" {
  type        = string
  description = "name of database"
  default     = "app"
}

variable "database_username" {
  type        = string
  description = "name from user of database"
  default     = "devusers"
}
