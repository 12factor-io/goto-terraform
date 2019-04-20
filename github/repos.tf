resource "github_repository" "website" {
  name          = "12factor.io"
  description   = "The 12factor.io public website"
  has_issues    = "true"
  has_downloads = "true"
  has_wiki      = "true"
}

resource "github_repository" "documentation" {
  name        = "documentation"
  description = "company wide awesome documentation"
}
