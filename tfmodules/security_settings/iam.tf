resource "aws_iam_policy" "ec2_policy" {
  name_prefix = "${var.windows_host_tag}User_iam_policy-"
  policy = file("${path.module}/iam_policy.json")
}

resource "aws_iam_role" "ec2_role" {
  name_prefix = "${var.windows_host_tag}User_iam_role-"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ec2_policy_role" {
  name = "${var.windows_host_tag}User_iam_attachment"
  roles = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name_prefix = "${var.windows_host_tag}User_ec2_profile-"
  role = aws_iam_role.ec2_role.name
}