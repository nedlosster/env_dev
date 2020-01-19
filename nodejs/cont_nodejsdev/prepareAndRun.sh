#!/bin/sh

printf "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" >> /etc/ssh/ssh_config

echo "dev_nodejsdev"
