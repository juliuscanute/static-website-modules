
resource "aws_ecr_repository" "build_image" {
  name = "${var.build_repository_name}"
}

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
    image                       = "${aws_ecr_repository.build_image.repository_url}:latest"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
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