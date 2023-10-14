variable "RELEASE" {
    default = "1.0.1"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["dharma18/oobabooga:${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
	
    }
}
