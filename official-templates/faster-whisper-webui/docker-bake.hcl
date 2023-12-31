variable "RELEASE" {
    default = "1.0.0"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/faster-whisper-webui:${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
}
