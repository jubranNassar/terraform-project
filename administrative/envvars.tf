resource "spacelift_mounted_file" "public-key" {
  stack_id      = "terraform-project"
  relative_path = "public-key"
  content       = filebase64("${path.module}/jubran-dev-key.pub")
}

# resource "spacelift_environment_variable" "" {
#   stack_id   = "worker-pool"
#   name       = "worker_pool_config"
#   value      = ""
#   write_only = false
# }