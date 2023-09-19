provider "docker" {}



resource "local_file" "sample_text_file"{
	filename = "/home/ubuntu/terraform-practice/demo.txt"
	content = "This is sample text file created by terraform"
}


resource "docker_image" "nginx-img-rsc" {
	name = "nginx:latest"
	keep_locally = false
}

resource "docker_container" "nginx-ctr-rsc" {
	name = "my-nginx-container"
	image = docker_image.nginx-img-rsc.name
	ports {
		internal = 80
		external = 80
	}

}
