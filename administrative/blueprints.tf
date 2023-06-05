resource spacelift_blueprint "cifrcloud" {
    name = "cifrcloud"
    space = "root"
    state = "DRAFT"
    template = file("./cifrcloud.yaml")
}