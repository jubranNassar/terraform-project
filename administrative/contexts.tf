resource "spacelift_mounted_file" "public-key" {
  stack_id      = "01GZYZVECGN71MSNY9HJ8YPGR2"
  relative_path = "public-key"
  content       = filebase64("${path.module}/public-key.json")
}