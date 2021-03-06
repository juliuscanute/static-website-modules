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

resource "aws_iam_role_policy" "aws_codebuild_policy" {
  role = "${aws_iam_role.aws_code_build_role.name}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Resource": [
        "${var.s3_bucket_arn}/*"
      ]
    }
  ]
}
POLICY
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
        "${aws_iam_role.aws_code_build_role.arn}"]
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
        "${aws_iam_role.aws_code_build_role.arn}"]
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
        "${aws_iam_role.aws_code_build_role.arn}"]
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
  bucket = "${var.s3_bucket_id}"
  policy = "${data.aws_iam_policy_document.aws_code_build_policy.json}"
}