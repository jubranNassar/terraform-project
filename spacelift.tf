resource "spacelift_policy" "check-instance-type" {
  name = "Let's make sure the instance type is t2.micro"
  body = file("./policies/plan/check-instance-type.rego")
  type = "PLAN"
}
