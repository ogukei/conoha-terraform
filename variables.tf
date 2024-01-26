
variable user_name {}

variable password {}

variable tenant_name {}

variable auth_url {
  default = "https://identity.c3j1.conoha.io/v3"
}

variable image_id  {
  # vmi-docker-24.0-ubuntu-20.04-amd64
  default = "6a674312-b23f-40db-abd4-a79c0e6c481b"
}

variable flavor_id {
  # g2l-t-c8m16
  default = "719b3191-3163-478a-b14c-cb667e0e19b2"
}

variable volume_type_id {
  # c3j1-ds02-boot
  # https://doc.conoha.jp/api-vps3/volume-get_types_list-v3/
  default = "209f3e4d-2652-409d-b0a6-0ac0fe954d79"
}

variable keypair_public_key {}

variable instance_admin_pass {}

variable volume_name {
  default = "terraform_volume"
}

variable instance_name {
  default = "terraform_instance"
}

variable instance_name_tag {
  default = "terraform_instance_tag"
}

variable keypair_name {
  default = "terraform_keypair"
}

variable security_group_name {}
