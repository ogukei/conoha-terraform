
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  user_name = var.user_name
  password = var.password
  tenant_name = var.tenant_name
  auth_url = var.auth_url
}

resource "openstack_compute_keypair_v2" "keypair" {
  name = var.keypair_name
  public_key = var.keypair_public_key
}

# Boot Volume
# https://doc.conoha.jp/api-vps3/volume-create_vol-v3/
resource "openstack_blockstorage_volume_v3" "volume" {
  name = var.volume_name
  size = 100
  image_id = var.image_id
  volume_type = var.volume_type_id
}

resource "openstack_compute_instance_v2" "instance" {
  name = var.instance_name
  flavor_id = var.flavor_id
  key_pair = openstack_compute_keypair_v2.keypair.id
  security_groups = [openstack_networking_secgroup_v2.secgroup.name]
  admin_pass = var.instance_admin_pass
  metadata = {
    instance_name_tag = var.instance_name_tag
  }

  block_device {
    uuid = openstack_blockstorage_volume_v3.volume.id
    source_type = "volume"
    boot_index = 0
    destination_type = "volume"
  }
}

resource "openstack_networking_secgroup_v2" "secgroup" {
  name = var.security_group_name
  description = var.security_group_description
  delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "udp"
  port_range_min = 8211
  port_range_max = 8211
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}
