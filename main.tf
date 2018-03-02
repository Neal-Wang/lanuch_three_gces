terraform {
  required_version = "= 0.11.2"
}

provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

data "google_compute_zones" "available" {}

resource "google_compute_instance" "default" {
	name = "${element(var.gce_names, count.index)}"
	machine_type = "n1-standard-1"
	zone = "${data.google_compute_zones.available.names[0]}"

	boot_disk = {
		initialize_params = {
			size = 30
			image = "ubuntu-1604-lts"
		}
	}
	network_interface = {
		network = "default"

		access_config = {}
	}

	count = "${length(var.gce_names)}"
}
