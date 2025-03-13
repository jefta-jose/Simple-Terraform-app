#----- the required_providers Block:Ensures Terraform knows which providers to download and their versions.

terraform{
    required_providers {
      docker ={
        source = "kreuzwerker/docker"
        version = "~> 3.0.1"
      }
    }
}

#------------ the provider Block:Provides the runtime configuration for the provider.

provider "docker" {
  
}

resource "docker_image" "nginx" {
  name = "nginx"
  keep_locally  = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name = "tutorial"

  ports{
    internal = 80
    external = 8000
  }
}
