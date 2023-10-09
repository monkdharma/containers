variable "RELEASE" {
    default = "0.0.2"
}

target "default" {
    dockerfile = "Dockerfile"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["dharma18/oobabooga:llama2-7b-chart-hf-${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
	
    }
}
