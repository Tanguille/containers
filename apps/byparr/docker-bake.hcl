target "docker-metadata-action" {}

variable "APP" {
  default = "byparr"
}

variable "VERSION" {
  // renovate: datasource=github-releases depName=ThePhaseless/Byparr
  default = "v1.2.1"
}

variable "SOURCE" {
  default = "https://github.com/ThePhaseless/Byparr"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
