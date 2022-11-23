variable "project_tags" {
  type        = map(string)
  description = "Tags used for aws tutorial"
  default = {
    project = "aws-terraform-test"
  }
}


variable "ssh_key" {
  description = "The key name of the Key Pair to use for the instance."
  default = "mykeys1"
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "disk_size" {
  description = "The size of the root volume in gigabytes."
  default     = 10
}

variable "public_ip" {
  type        = string
  description = "Your public IP goes here"
  default     = "0.0.0.0/0"
}

variable "project" {
  description = "Project tag."
  default = "myProject"
}


variable "alb_names" {
   type = map
   default = { for alb_names in ["test", "test1" ] : alb_names =>     alb_names }
}

