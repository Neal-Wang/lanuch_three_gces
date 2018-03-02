output "instance_id" {
	value = "${join(",", google_compute_instance.default.*.self_link)}"
}

output "private_ip" {
	value = "${join(",", google_compute_instance.default.*.network_interface.0.address)}"
}

output "public_ip" {
	value = "${join(",", google_compute_instance.default.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}