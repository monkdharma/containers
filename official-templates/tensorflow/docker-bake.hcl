variable "RELEASE" {
    default = "1.0.4"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/tensorflow:2.14.0-jupyter-${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
