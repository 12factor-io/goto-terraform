variable "GITHUB_TOKEN" {
  type = "string"
  description = "Github personal access token. Permissions needed: admin:org and repo. see: https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line"
}

variable "organisation" {
  default = "12factor-io"
}
