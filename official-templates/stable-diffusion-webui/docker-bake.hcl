variable "RELEASE" {
    default = "1.0.8"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/stable-diffusion:web-ui-${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
