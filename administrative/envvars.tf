resource "spacelift_mounted_file" "public-key" {
  stack_id      = "terraform-project"
  relative_path = "public-key"
  content       = filebase64("${path.module}/jubran-dev-key.pub")
}