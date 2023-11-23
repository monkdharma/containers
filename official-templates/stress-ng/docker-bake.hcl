variable "RELEASE" {
    default = "latest"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/stress-ng:${RELEASE}"]
}
