
provider "aws" {
  region = "us-west-1"
  
}


variable "ami_id_map" {
  type = map(string)
  default = {
    "us-west-1" = "ami-0c55b159cbfafe1f0"  # Example AMI ID for us-west-1 region
    "us-west-2" = "ami-0df24e148fdb9f1d8"  # Example AMI ID for us-west-2 region
  }
}


resource "aws_instance" "example" {
  ami           = lookup(var.ami_id_map, "us-west-2", "ami-0c55b159cbfafe1f0")  # Use AMI ID from map, or default to "ami-1234567890"
  instance_type = "t2.micro"
  #key_name      = "mykeypair"

  tags = {
    Name = "example-instance"
  }
}
