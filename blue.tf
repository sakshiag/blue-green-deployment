resource "null_resource" "prepare_blue_app_zip" {
  triggers = {
    app_version = "${var.app_version_blue}"
    git_repo    = "${var.git_repo}"
  }

  provisioner "local-exec" {
    command = <<EOF
mkdir -p ${var.dir_to_clone_blue}
cd ${var.dir_to_clone_blue}
git init
git remote add origin ${var.git_repo}
git fetch
git checkout tags/v0.1.0
zip -r ${var.app_blue_zip} *
EOF
  }
}

data "ibm_space" "space" {
  org   = "${var.org}"
  space = "${var.space}"
}

data "ibm_app_domain_shared" "domain" {
  name = "mybluemix.net"
}

resource "ibm_app_route" "route" {
  domain_guid = "${data.ibm_app_domain_shared.domain.id}"
  space_guid  = "${data.ibm_space.space.id}"
  host        = "${var.route}"
}

resource "ibm_app" "blue_app" {
  depends_on        = ["null_resource.prepare_blue_app_zip"]
  name              = "${var.app_name_blue}"
  space_guid        = "${data.ibm_space.space.id}"
  app_path          = "${var.app_blue_zip}"
  wait_time_minutes = 10
  memory            = 128
  instances         = 2
  disk_quota        = 512
  command           = "python app.py"
  app_version       = "${var.app_version_blue}"
}
