resource spacelift_blueprint "cifrcloud" {
    name = "cifrcloud"
    space = "root"
    state = "PUBLISHED"
    template = file("./cifrcloud.yaml")
}