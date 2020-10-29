# terraform-digitalocean
Terraform template to create a VM with Digital Ocean.

## Requirements

- Install Packer to build the image:  https://learn.hashicorp.com/tutorials/terraform/install-cli
- Get a Digital Ocean API token: https://cloud.digitalocean.com/account/api/tokens


## How to create the VM

### Create variables file
In the root path of the code, create a file named terraform.tfvars and place the following variables:


```
do_token: must have the token created in the previous step.
droplet_ssh_key_id: The id of the key in DigitalOcean that will be used to connect to the virtual machine
droplet_name: The name of the droplet in DigitalOcean
droplet_image: The name of the image to use in DigitalOcean
droplet_size: The size of the droplet to use
droplet_region: The region where the droplet will be deployed

```

To obtain the values of the region, the ssh key, the name  of the image and the size of the virtual machine, install the Digital Ocean command-line client: https://www.digitalocean.com/docs/apis-clis/doctl/

Export the DO token asn an environment variable:
```
export DIGITALOCEAN_API_TOKEN=xxxdfc7f164a7001f76048313b0970bd46092f20569b9780ac242b00c9a7axxx
```

Change the value to your token.


To list all available ssh keys in the account:
```

$ doctl  -t $DIGITALOCEAN_API_TOKEN compute ssh-key list
```


To list all OS available:
```

$ doctl  -t $DIGITALOCEAN_API_TOKEN compute  image list --public
```


To list all OS available:
```

$ doctl  -t $DIGITALOCEAN_API_TOKEN compute  region list
```


To list all sizes available:
```

$ doctl  -t $DIGITALOCEAN_API_TOKEN compute  size list
```

**terraform.tfvars**
```
do_token = "xxxdfc7f164a7001f76048313b0970bd46092f20569b9780ac242b00c9a7axxx"
droplet_ssh_key_id = "1632017"
droplet_name = "server-by-terraform"
droplet_image = "ubuntu-20-04-x64"
droplet_size = "s-1vcpu-1gb"
droplet_region = "nyc1"
```

### Execute terraform


To deploy the server we just have to execute the following commands:
```

$ terraform plan
$ terraform apply