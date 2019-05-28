provider "aws" {

}


resource "aws_launch_template" "new-template"{
  name_prefix = "new-template"
  image_id = "ami-2757f631"
  instance_type = "t2.micro"

}

resource "aws_autoscaling_group" "terraform-sample"{
  availability_zones = ["us-east-1a"]
  desired_capacity = 0
  max_size = 0
  min_size = 0

  launch_template {
    id = "${aws_launch_template.new-template.id}"
    version = "$Latest"
  }
}
