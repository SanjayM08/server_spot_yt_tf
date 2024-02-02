provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAZAN3XIFAV3LAQZ6Q"
  secret_key = "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"
}

resource "aws_instance" "YOUTUBE" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              docker pull sanjaym08/loverboy_youtube_site
              docker run -d -p 80:80 sanjaym08/loverboy_youtube_site
              EOF

  tags = {
    Name = "YOUTUBE"
  }
}

output "public_ip" {
  value = aws_instance.YOUTUBE.public_ip
}

