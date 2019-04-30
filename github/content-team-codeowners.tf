resource "github_team" "content_approvers" {
  name           = "Content-approvers"
  description    = "Members of this team have permissions to approve pull requests for the content team"
  privacy        = "closed"
  parent_team_id = "${github_team.content.id}"
}
