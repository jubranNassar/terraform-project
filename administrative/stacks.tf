resource "spacelift_stack" "terraform-project" {
    branch = "main"
    name = "terraform-project"
    repository = "terraform-project"
}