resource "aws_iam_role" "aws_code_build_role" {
  name = "${var.codebuild_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_ecr_repository_policy" "repository_policy" {
  repository = "${var.repository_policy_name}"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer"
            ]
        }
    ]
}
EOF
}

data "aws_iam_policy_document" "aws_code_build_policy" {
  statement {
    actions = [
      "s3:GetObject"]
    resources = [
      "${var.s3_bucket_arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        "${aws_iam_role.aws_code_build_role.id}"]
    }
  }

  statement {
    actions = [
      "s3:PutObject"]
    resources = [
      "${var.s3_bucket_arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        "${aws_iam_role.aws_code_build_role.id}"]
    }
  }


  statement {
    actions = [
      "s3:ListBucket"]
    resources = [
      "${var.s3_bucket_arn}"]

    principals {
      type = "AWS"
      identifiers = [
        "${aws_iam_role.aws_code_build_role.id}"]
    }
  }

  statement {
    actions = [
      "s3:GetObject"]
    resources = [
      "${var.s3_bucket_arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        "${var.origin_iam_arn}"]
    }
  }
}

resource "aws_s3_bucket_policy" "aws_code_build_access" {
  bucket = "${s3_bucket_id}"
  policy = "${data.aws_iam_policy_document.aws_code_build_policy.json}"
}