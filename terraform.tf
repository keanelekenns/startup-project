terraform {
  required_providers {
    aws =  {
    source = "hashicorp/aws"
    version = ">= 2.7.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_backend_bucket" {
      bucket = "terraform-state-xtomjxkdi3bxpm597dqg90w533dgqicn0c1w3c52gxw1a"
}

resource "aws_instance" "Instance-zffz-a" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.medium"
      lifecycle {
        ignore_changes = [ami]
      }
}

resource "aws_iam_user" "Instance-zffz-a_iam" {
      name = "Instance-zffz-a_iam"
}

resource "aws_iam_user_policy_attachment" "Instance-zffz-a_iam_policy_attachment0" {
      user = aws_iam_user.Instance-zffz-a_iam.name
      policy_arn = aws_iam_policy.Instance-zffz-a_iam_policy0.arn
}

resource "aws_iam_policy" "Instance-zffz-a_iam_policy0" {
      name = "Instance-zffz-a_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Instance-zffz-a_iam_policy_document.json
}

resource "aws_iam_access_key" "Instance-zffz-a_iam_access_key" {
      user = aws_iam_user.Instance-zffz-a_iam.name
}

resource "aws_instance" "Instance-zffz-d" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.medium"
      lifecycle {
        ignore_changes = [ami]
      }
}

resource "aws_iam_user" "Instance-zffz-d_iam" {
      name = "Instance-zffz-d_iam"
}

resource "aws_iam_user_policy_attachment" "Instance-zffz-d_iam_policy_attachment0" {
      user = aws_iam_user.Instance-zffz-d_iam.name
      policy_arn = aws_iam_policy.Instance-zffz-d_iam_policy0.arn
}

resource "aws_iam_policy" "Instance-zffz-d_iam_policy0" {
      name = "Instance-zffz-d_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Instance-zffz-d_iam_policy_document.json
}

resource "aws_iam_access_key" "Instance-zffz-d_iam_access_key" {
      user = aws_iam_user.Instance-zffz-d_iam.name
}

resource "aws_instance" "Instance-zffz-c" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.medium"
      lifecycle {
        ignore_changes = [ami]
      }
}

resource "aws_iam_user" "Instance-zffz-c_iam" {
      name = "Instance-zffz-c_iam"
}

resource "aws_iam_user_policy_attachment" "Instance-zffz-c_iam_policy_attachment0" {
      user = aws_iam_user.Instance-zffz-c_iam.name
      policy_arn = aws_iam_policy.Instance-zffz-c_iam_policy0.arn
}

resource "aws_iam_policy" "Instance-zffz-c_iam_policy0" {
      name = "Instance-zffz-c_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Instance-zffz-c_iam_policy_document.json
}

resource "aws_iam_access_key" "Instance-zffz-c_iam_access_key" {
      user = aws_iam_user.Instance-zffz-c_iam.name
}

data "aws_iam_policy_document" "Instance-zffz-a_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.Instance-zffz-a.arn]
      }
}

data "aws_ami" "amazon_latest" {
      most_recent = true
      owners = ["585441382316"]
      filter {
        name = "name"
        values = ["*AmazonLinux*"]
      }
      filter {
        name = "virtualization-type"
        values = ["hvm"]
      }
}

data "aws_iam_policy_document" "Instance-zffz-d_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.Instance-zffz-d.arn]
      }
}

data "aws_iam_policy_document" "Instance-zffz-c_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.Instance-zffz-c.arn]
      }
}



