provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for the IAM policy"
  type        = string
}

resource "aws_iam_group" "cmtr_group" {
  name = "cmtr-ghjc0xhd-iam-group"

}

resource "aws_iam_policy" "cmtr_policy" {
  name        = "cmtr-ghjc0xhd-iam-policy"
  description = "Grants write access to the specified S3 bucket"
  policy      = templatefile("${path.module}/policy.json", { bucket_name = var.bucket_name })

  tags = {
    Project = "cmtr-ghjc0xhd"
  }
}

resource "aws_iam_role" "cmtr_role" {
  name = "cmtr-ghjc0xhd-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Project = "cmtr-ghjc0xhd"
  }
}

resource "aws_iam_role_policy_attachment" "attach_policy_to_role" {
  role       = aws_iam_role.cmtr_role.name
  policy_arn = aws_iam_policy.cmtr_policy.arn
}

resource "aws_iam_instance_profile" "cmtr_instance_profile" {
  name = "cmtr-ghjc0xhd-iam-instance-profile"
  role = aws_iam_role.cmtr_role.name

}