group "default" {
    targets = [
	"ubuntu2204-cuda1180-python310",
        "ubuntu2004-cuda1131-python310",
	"ubuntu2004-cuda1111-python310"

    ]
}


target "ubuntu2204-cuda1180-python310" {
    dockerfile = "Dockerfile"
    tags = ["podwise/miniconda:ubuntu22.04-python3.10-cuda11.8"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
    args = {
        BASE_IMAGE = "nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04"
	MINICONDA = "https://repo.anaconda.com/miniconda/Miniconda3-py310_23.9.0-0-Linux-x86_64.sh"
    }
}

target "ubuntu2004-cuda1131-python310" {
    dockerfile = "Dockerfile"
    tags = ["podwise/miniconda:ubuntu20.04-python3.10-cuda11.3"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
    args = {
        BASE_IMAGE = "nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04"
	MINICONDA = "https://repo.anaconda.com/miniconda/Miniconda3-py310_23.9.0-0-Linux-x86_64.sh"
    }
}

target "ubuntu2004-cuda1111-python310" {
    dockerfile = "Dockerfile"
    tags = ["podwise/miniconda:ubuntu20.04-python3.10-cuda11.1"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
    args = {
        BASE_IMAGE = "nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04"
	MINICONDA = "https://repo.anaconda.com/miniconda/Miniconda3-py310_23.9.0-0-Linux-x86_64.sh"
    }
}
