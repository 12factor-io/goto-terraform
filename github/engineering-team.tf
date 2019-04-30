locals  {
  engineering_team_members =  ["ewilde"]
}

// repos

resource "github_repository" "engineering_cab_tester" {
  name     = "cab-tester"
  has_wiki = false
}

resource "github_repository" "engineering_middleman_12factor" {
  name     = "middleman-12factor"
  has_wiki = true
}

// teams
resource "github_team" "engineering" {
  name        = "Engineering"
  description = "Members of this team write software"
  privacy     = "closed"
}

// team membership
resource "github_team_membership" "engineering_team_membership" {
  team_id  = "${github_team.engineering.id}"
  username = "${local.engineering_team_members[count.index]}"
  role     = "maintainer"
  count    = "${length(local.engineering_team_members)}"
}

// team permissions
resource "github_team_repository" "team_repo_engineering_cab_tester" {
  team_id    = "${github_team.engineering.id}"
  repository = "${github_repository.engineering_cab_tester.name}"
  permission = "push"
}

resource "github_team_repository" "team_repo_middleman_12factor" {
  team_id    = "${github_team.engineering.id}"
  repository = "${github_repository.engineering_middleman_12factor.name}"
  permission = "push"
}

resource "github_team_repository" "team_repo_engineering_documentation" {
  team_id    = "${github_team.engineering.id}"
  repository = "${github_repository.content_documentation.name}"
  permission = "push"
}
