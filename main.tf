terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}
provider "docker" {}

provider "local" {
  # Configuration options
}


resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
resource "local_sensitive_file" "foo" {
  content  = "foo! terraform encrypt  ${var.myname}"
  filename = "${path.module}/foo.bar"
}