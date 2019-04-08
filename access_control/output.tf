output codebuild_iam_role_arn {
  value = "${aws_iam_role.aws_code_build_role.arn}"
}