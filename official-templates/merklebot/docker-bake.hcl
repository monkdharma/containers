variable "RELEASE" {
    default = "1.0.2"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/merklebot:${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
