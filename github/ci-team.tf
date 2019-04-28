locals  {
  ci_team_members =  ["jeeves-form3-oss"]
}

resource "github_repository" "goto_terraform" {
  name = "goto-terraform"
}

resource "github_team" "ci" {
  name        = "CI"
  description = "Members of this team manage content within the organisation i.e. documentation, the website ..."
}

// team membership
resource "github_team_membership" "ci_team_membership" {
  team_id  = "${github_team.ci.id}"
  username = "${local.ci_team_members[count.index]}"
  role     = "member"
  count    = "${length(local.ci_team_members)}"
}

resource "github_repository" "userguides" {
  name           = "userguides"
  description    = "company wide awesome userguides"
  default_branch = "master"
}

// team permissions
resource "github_team_repository" "team_repo_goto_terraform" {
  team_id    = "${github_team.ci.id}"
  repository = "${github_repository.goto_terraform.name}"
  permission = "admin"
}
