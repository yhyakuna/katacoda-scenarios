#!/usr/bin/env bash
apt-get update && apt-get install -y jq

ssh root@host01 "apt-get update && apt-get install -y jq"
