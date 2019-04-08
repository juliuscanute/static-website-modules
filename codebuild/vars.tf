variable project_name {
  description = "Name of the project"
  type = "string"
  default = "test-project"
}

variable project_description {
  description = "Describe what this project does briefly"
  type = "string"
  default = "test_codebuild_project"
}

variable iam_role_arn {
  description = "IAM Role ARN"
}

variable build_repository_name {
  description = "Name of the repository"
}