# Web Server Deployment

A simple containerized web application deployed to DigitalOcean using Infrastructure as Code.

## Overview

This project demonstrates automated deployment of a "Hello World" web app using:
- **Terraform** - Infrastructure provisioning on DigitalOcean
- **Ansible** - Server configuration and Docker deployment
- **Docker** - Application containerization

## Architecture

- 2x Ubuntu 22.04 droplets in Singapore region
- Docker containers running Python HTTP server
- Application accessible on port 8000

## Prerequisites

- DigitalOcean account and API token
- SSH key pair (`~/.ssh/id_ed25519`)
- Terraform and Ansible installed

## Deployment

1. Set up environment:
   ```bash
   echo "DIGITALOCEAN_TOKEN=your_token_here" > terraform/.env
   ```

2. Deploy infrastructure:
   ```bash
   cd terraform
   ./scripts/tf-apply.sh
   ```

3. Access application at `http://<droplet-ip>:8000`

## Cleanup

```bash
cd terraform
./scripts/tf-destroy.sh
```

## Project Structure

```
├── terraform/          # Infrastructure as Code
├── ansible/            # Configuration management
└── hello-world/        # Application code and Dockerfile
```
