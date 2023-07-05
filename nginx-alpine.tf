terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:1.25.1"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.1.25.1
  name  = "nginx-server"
  ports {
    internal = 80
    external = 8000
  }
}
