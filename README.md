## Usage

Install client
```
apt install python3-pip
pip install openstackclient==4.0.0
which openstack
# /home/user/.local/bin/openstack
openstack --version
# openstack 6.4.0
```

Note: Installing the openstack client via apt is not recommended because the list-flavor command does not seem to work with ConoHa.

Prepare `admin-openrc.sh``
https://docs.openstack.org/liberty/install-guide-obs/keystone-openrc.html

```
export OS_TENANT_NAME=gnct01234
export OS_USERNAME=gncu56789
export OS_PASSWORD=password
export OS_AUTH_URL=https://identity.c3j1.conoha.io/v3
export OS_IDENTITY_API_VERSION=3
```

Call api
https://docs.openstack.org/api-quick-start/api-quick-start.html

Image
```
openstack image list
```

use this image
```
vmi-docker-24.0-ubuntu-20.04-amd64
```

Flavor
```
openstack flavor list --sort-ascending --sort-column RAM
```

use this flavor (8CPU 16GB). It is the same as the plan shown 16GB in the controller panel.
```
| 719b3191-3163-478a-b14c-cb667e0e19b2 | g2l-t-c8m16 | ...
```

Volume
```
openstack volume type list
```

use this volume as [the doc](https://doc.conoha.jp/api-vps3/api-create_vm-v3/) specifies it.
```
| 209f3e4d-2652-409d-b0a6-0ac0fe954d79 | c3j1-ds02-boot 
```

---

terraform.tfvars

```
user_name = "gnct01234"
password = ""
tenant_name = "gnct56789"

keypair_public_key = "ssh-ed25519 AAAAC"
instance_admin_pass = "adminpass"
```

Note
https://www.terraform-best-practices.com/naming
https://github.com/snemetz/openstack-scripts/blob/master/block-device-mapping.notes

