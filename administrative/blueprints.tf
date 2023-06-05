resource spacelift_blueprint "cifrcloud" {
    name = "cifrcloud"
    space = "root"
    state = "DRAFT"
    template = "./cifrcloud.yaml"
}