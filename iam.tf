resource "aws_iam_role" "amazon_ec2_role_for_s3" {
  name               = "AmazonEC2RoleForS3"
  path               = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "amazon_s3_get_access_policy" {
  name   = "AmazonS3GetAccess"
  role   = aws_iam_role.amazon_ec2_role_for_s3.id
  policy = <<EOF
{
  "Statement": [
    {
      "Sid": "AllowAppArtifactsReadAccess",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "amazon_ec2_role_for_s3_iam" {
  name = "amazon_ec2_role_for_s3_iam"
  role = aws_iam_role.amazon_ec2_role_for_s3.name
}