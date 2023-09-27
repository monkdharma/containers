variable "RELEASE" {
    default = "0.0.1"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/llama2:llama2-7b-chart-hf-${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
	
    }
}
