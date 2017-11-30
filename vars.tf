variable "app_version_blue" {
  default = "1"
}

variable "git_repo" {
  default = "https://github.com/ashishth09/cf-python-app.git"
}

variable "dir_to_clone_blue" {
  default = "/tmp/blue"
}

variable "app_blue_zip" {
  default = "/tmp/blue.zip"
}

variable "org" {
  default = ""
}

variable "space" {
  default = ""
}

variable "route" {
  default = "my-welcome-app"
}

variable "app_name_blue" {
  default = "myblueapp"
}

variable "app_version_green" {
  default = "1"
}

variable "dir_to_clone_green" {
  default = "/tmp/green"
}

variable "app_green_zip" {
  default = "/tmp/green.zip"
}

variable "temp_route" {
  default = "my-welcome-app-temp"
}

variable "app_name_green" {
  default = "mygreenapp"
}
