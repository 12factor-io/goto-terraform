locals  {
  content_team_members =  ["bob-ewilde", "sally-ewilde"]
}

resource "github_repository" "content_website" {
  name          = "12factor.io"
  description   = "The 12factor.io public website"
  has_issues    = "true"
  has_downloads = "true"
  has_wiki      = "true"
}

// repos
resource "github_repository" "content_documentation" {
  name           = "documentation"
  description    = "company wide awesome documentation"
  auto_init      = true
}

resource "github_repository" "userguides" {
  name           = "userguides"
  description    = "company wide awesome userguides"
}


// teams
resource "github_team" "content" {
  name        = "Content"
  description = "Members of this team manage content within the organisation i.e. documentation, the website ..."
  privacy     = "closed"
}

resource "github_branch_protection" "content_documentation" {
  branch = "master"
  repository = "${github_repository.content_documentation.id}"
  required_pull_request_reviews {
    require_code_owner_reviews = true
  }
}
resource "codeowners_file" "main" {
  repository_owner = "${var.organisation}"
  repository_name  = "${github_repository.content_documentation.name}"
  branch           = "master"
  rules = [
    {
      pattern   = "*"
      usernames = ["${var.organisation}/${github_team.content_approvers.name}"]
    }
  ]
}

// team membership
resource "github_team_membership" "content_team_membership" {
  team_id  = "${github_team.content.id}"
  username = "${local.content_team_members[count.index]}"
  role     = "member"
  count    = "${length(local.content_team_members)}"
}

// team permissions
resource "github_team_repository" "team_repo_documentation" {
  team_id    = "${github_team.content.id}"
  repository = "${github_repository.content_documentation.name}"
  permission = "push"
}

resource "github_team_repository" "team_repo_webiste" {
  team_id    = "${github_team.content.id}"
  repository = "${github_repository.content_website.name}"
  permission = "push"
}





