
### Plan policies ###
resource "spacelift_policy" "check-instance-type" {
  name = "Let's make sure the instance type is t2.micro"
  body = file("../policies/plan/check-instance-type.rego")
  type = "PLAN"
}


### Push policies ###

resource "spacelift_policy" "trigger-run-from-pr" {
  name = "trigger run from pr"
  body = file("../policies/push/trigger-run-from-pr.rego")
  type = "GIT_PUSH"
}