/**
 * This repository manages the 12factor-io engineering department
 */
provider "github" {
  token        = "${var.GITHUB_TOKEN}"
  organization = "12factor-io"
}
