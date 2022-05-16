variable "s3_bucket_path" {
  description = "S3 bucket name"
  default     = "klaytn-node-config"
}

variable "key_bastion" {
  description = "bastion keypair"
  default     = "test-bastion"
}

variable "key_scn" {
  description = "scn keypair"
  default     = "test-bastion"
}

data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-hvm-2.0*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

variable "aws_region" {
  description = "AWS region"
  default = "ap-northeast-2"
}

variable "scn_type" {
  description = "SCN instance type"
  default = "t3.xlarge"
}

variable "scn_volume_type" {
  description = "SCN volume type"
  default = "gp3"
}

variable "scn_volume_size" {
  description = "SCN volume type"
  default = "30"
}