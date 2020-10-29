variable "do_token" {}
variable "droplet_ssh_key_id" {}
variable "droplet_name" {}
variable "droplet_image" {}
variable "droplet_size" {}
variable "droplet_region" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# Create a web server
resource "digitalocean_droplet" "server-by-terrraform" {
  image      = var.droplet_image
  name       = var.droplet_name
  region     = var.droplet_region
  size       = var.droplet_size
  monitoring = "true"
  ssh_keys   = [var.droplet_ssh_key_id]
}

