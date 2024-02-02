provider "aws" {
  region     = "us-east-2"
  access_key = "xxxxxxx"
  secret_key = "xxxxxxx"
}

resource "aws_instance" "SPOTIFY" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              docker pull sanjaym08/spotify:v5
              docker run -d -p 80:80 sanjaym08/spotify:v5
              docker pull sanjaym08/loverboy_youtube_site
              docker run d -p 443:80 sanjaym08/loverboy_youtube_site
              EOF

  tags = {
    Name = "SPOTIFY"
  }
}

output "public_ip" {
  value = aws_instance.SPOTIFY.public_ip
}
