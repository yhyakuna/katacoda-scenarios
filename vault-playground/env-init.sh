#!/usr/bin/env bash

host_commands=(
"curl -s -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip"
"chmod +x ~/.bin/unzip"
"curl -s -L -o ~/vault.zip https://releases.hashicorp.com/vault/1.0.1/vault_1.0.1_linux_amd64.zip"
"unzip -d ~/.bin ~/vault.zip && rm ~/vault.zip"

"apt-get install -y jq"
)

all_commands=$(awk -v sep=' && ' 'BEGIN{ORS=OFS="";for(i=1;i<ARGC;i++){print ARGV[i],ARGC-i-1?sep:""}}' "${host_commands[@]}")

echo "$all_commands"

ssh root@host01 "$all_commands"
