resource "spacelift_stack" "terraform-project" {
    branch = "main"
    name = "terraform-project"
    repository = "terraform-project"
    project_root = "first-project"
    github_enterprise {
        namespace = "jubranNassar"
    }
}


resource "spacelift_stack" "worker-pool" {
    branch = "main"
    name = "worker-pool"
    repository = "terraform-project"
    project_root = "worker-pool"
    github_enterprise {
        namespace = "jubranNassar"
    }
}