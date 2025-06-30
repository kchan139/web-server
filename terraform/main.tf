terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
}

resource "digitalocean_ssh_key" "web" {
  name       = "Test DigitalOcean SSH key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "digitalocean_droplet" "web" {
  count  = 2
  image  = "ubuntu-22-04-x64"
  name   = "hello-world-${count.index + 1}"
  region = "sgp1"
  size   = "s-1vcpu-512mb-10gb"
  ssh_keys = [
    digitalocean_ssh_key.web.id
  ]

  provisioner "local-exec" {
    command = "sleep 30 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.ipv4_address},' --private-key ~/.ssh/id_ed25519 -u root ../ansible/webserver_playbook.yml"
    when    = create
  }

  backups = false
  # backups = true
  # backup_policy {
  #   plan    = "weekly"
  #   weekday = "TUE"
  #   hour    = 8
  # }
}
