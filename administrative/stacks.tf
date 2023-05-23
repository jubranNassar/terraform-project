resource "spacelift_stack" "terraform-project" {
    branch = "main"
    name = "terraform-project"
    repository = "terraform-project"
    project_root = "first-project"
    worker_pool_id = "01H123RBHVK3GAX2KSTFC5R5WP"
    github_enterprise {
        namespace = "jubranNassar"
    }
}

resource "spacelift_drift_detection" "terraform-project-drift" {
  reconcile = true
  stack_id  = spacelift_stack.terraform-project.id
  schedule  = ["*/15 * * * *"] # Every 15 minutes
  timezone = "EDT"
}


resource "spacelift_stack" "worker-pool" {
    branch = "main"
    name = "worker-pool"
    repository = "terraform-project"
    project_root = "worker-pool"
    worker_pool_id = "01H123RBHVK3GAX2KSTFC5R5WP"
    github_enterprise {
        namespace = "jubranNassar"
    }
}