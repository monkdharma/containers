variable "RELEASE" {
    default = "0.0.1"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["harbor.podwise.co/podwise/stable-diffusion:web-ui-${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
