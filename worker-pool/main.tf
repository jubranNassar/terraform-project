resource "spacelift_worker_pool" "AWS-ASG" {
  name        = "AWS-ASG"
  csr         = filebase64("../spacelift.csr")
  description = "Used for all type jobs"
}