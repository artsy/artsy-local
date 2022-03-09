#!/bin/bash

mkdir -p ~/.aws
touch ~/.aws/credentials
touch ~/.aws/config

echo "creating fake aws config files..."
cat <<EOT >> ~/.aws/credentials
[local]
aws_access_key_id = local
aws_secret_access_key = local
EOT

cat <<EOT >> ~/.aws/config
[profile local]
region = local
EOT
