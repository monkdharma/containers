variable "RELEASE" {
    default = "1.0.0"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/tensorflow:${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
