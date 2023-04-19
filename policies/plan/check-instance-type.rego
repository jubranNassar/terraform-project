package spacelift

deny[sprintf("%q Denied due to instance type, please choose t2.micro",[resource.address])] {
resource := input.terraform.resource_changes[_]
instance := resource.change.after.instance_type
instance != "t2.micro"
}

sample{true}