variable "RELEASE" {
    default = "llama2-7b-1.0.4"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["podwise/oobabooga:${RELEASE}"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
	
    }
}
