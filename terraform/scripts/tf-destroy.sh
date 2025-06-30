#!/bin/bash

set -e

source .env

DIGITALOCEAN_TOKEN=$DIGITALOCEAN_TOKEN terraform destroy
