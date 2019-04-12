resource "aws_codebuild_project" "build_project" {
  name          = "${var.project_name}"
  description   = "${var.project_description}"
  build_timeout = "5"
  service_role  = "${var.iam_role_arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "${var.build_repository_name}"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"

    environment_variable {
      "name"  = "BUCKET_NAME"
      "value" = "${var.aws_bucket_name}"
    }

  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/juliuscanute/hugo-template-website"
    git_clone_depth = 1
  }

  tags = {
    "Environment" = "Production"
  }
}