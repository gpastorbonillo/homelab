resource "github_repository" "github-repo-1" {
  name        = "homelab"
  description = "My awesome codebase"
  auto_init = true
  visibility = "private"
}

