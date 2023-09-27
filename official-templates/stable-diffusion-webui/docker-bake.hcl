variable "RELEASE" {
    default = "0.0.1"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/stable-diffusion:web-ui-${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
