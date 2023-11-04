group "default" {
    targets = [
	"2204-py3-cuda1180-devel",
        "2004-py3-cuda1131-devel",
	"2004-py3-cuda1111-devel"

    ]
}


target "2204-py3-cuda1180-devel" {
    dockerfile = "Dockerfile"
    tags = ["podwise/ubuntu:22.04-cuda11.8.0-py3.10-torch2.0.1-tf2-1.0.0"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
    args = {
        BASE_IMAGE = "nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04"
	TORCH = "torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118"
    }
}

target "2004-py3-cuda1131-devel" {
    dockerfile = "Dockerfile"
    tags = ["podwise/ubuntu:20.04-cuda11.3.1-py3.10-torch2.0.1-tf2-1.0.0"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
    args = {
        BASE_IMAGE = "nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04"
	TORCH = "torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113"
    }
}

target "2004-py3-cuda1111-devel" {
    dockerfile = "Dockerfile"
    tags = ["podwise/ubuntu:20.04-cuda11.1.1-py3-torch2.0.1-tf2-1.0.0"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
    }
    args = {
        BASE_IMAGE = "nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04"
	TORCH = "torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html"
    }
}
