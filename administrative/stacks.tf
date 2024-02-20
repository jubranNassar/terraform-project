resource "spacelift_stack" "terraform-project" {
    branch = "main"
    name = "terraform-project"
    repository = "terraform-project"
    project_root = "first-project"
    terraform_smart_sanitization = true
    worker_pool_id = "01H123RBHVK3GAX2KSTFC5R5WP"
    space_id = "demo-resources-01H7T746B176K9S5MH0N63MGPH"
    github_enterprise {
        namespace = "jubranNassar"
    }
}

resource "spacelift_drift_detection" "terraform-project-drift" {
  reconcile = true
  stack_id  = spacelift_stack.terraform-project.id
  schedule  = ["*/15 * * * *"] # Every 15 minutes
  timezone = "America/New_York"
}


resource "spacelift_stack" "worker-pool" {
    branch = "main"
    name = "worker-pool"
    repository = "terraform-project"
    project_root = "worker-pool"
    terraform_smart_sanitization = true
    worker_pool_id = "01H123RBHVK3GAX2KSTFC5R5WP"
    github_enterprise {
        namespace = "jubranNassar"
    }
}

resource "spacelift_stack" "cloudformation-test" {
    cloudformation {
    entry_template_file = "main.yaml"
    region              = "us-east-1"
    template_bucket     = "s3://jubran-test-bucket/cloudformation-spacelift-stack/"
    stack_name          = "cloudformation-spacelift-stack"
  }
  branch = "main"
  name = "cloudformation-test"
  repository = "cloudformation-example"
  github_enterprise {
    namespace = "jubranNassar"
  }
}

