workflow "Deploy" {
  on = "push"
  resolves = ["deploy"]
}

action "install" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "ci"
}

action "deploy" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["install"]
  args = "run deploy"
  secrets = ["GITHUB_TOKEN"]
}
