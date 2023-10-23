variable "RELEASE" {
    default = "22.04-cuda11.8.0-py3.10-torch2.0.1-tf2-1.0.1"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/ubuntu:${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
