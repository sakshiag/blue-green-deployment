variable "bm_api_key" {
}

provider "ibm" {
  bluemix_api_key = "${var.bm_api_key}"
}
