#!/usr/bin/env bash
apt-get install -y jq

ssh root@host01 "apt-get install -y jq &"
