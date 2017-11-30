resource "null_resource" "prepare_green_app_zip" {
  triggers = {
    app_version = "${var.app_version_green}"
    git_repo    = "${var.git_repo}"
  }

  provisioner "local-exec" {
    command = <<EOF
        mkdir -p ${var.dir_to_clone_green}
        cd ${var.dir_to_clone_green}
        git init
        git remote add origin ${var.git_repo}
        git fetch
        git checkout tags/v0.2.0
        zip -r ${var.app_green_zip} *
        EOF
  }
}

resource "ibm_app_route" "temp_route" {
  domain_guid = "${data.ibm_app_domain_shared.domain.id}"
  space_guid  = "${data.ibm_space.space.id}"
  host        = "${var.temp_route}"
}

resource "ibm_app" "green_app" {
  depends_on        = ["null_resource.prepare_green_app_zip"]
  name              = "${var.app_name_green}"
  space_guid        = "${data.ibm_space.space.id}"
  app_path          = "${var.app_green_zip}"
  wait_time_minutes = 10
  memory            = 128
  instances         = 2
  disk_quota        = 512
  route_guid        = ["${ibm_app_route.route.id}"]
  command           = "python app.py"
  app_version       = "${var.app_version_green}"
}
