#!/bin/bash

echo "Setting Postfix configuration based on environment variables..."
## Events brackets are required for nginx to start, so we add it to the config file
postfix_hostname="$(sed "/myhostname = */c\myhostname = ${POSTFIX_hostname}" "/etc/postfix/main.cf")"
echo "$postfix_hostname" > /etc/postfix/main.cf
postfix_mail_name="$(sed "s/\$mail_name/${POSTFIX_mail_name}/g" "/etc/postfix/main.cf")"
echo "$postfix_mail_name" > /etc/postfix/main.cf
postfix_emails="$(sed "s/virtual_alias_domains = localhost/virtual_alias_domains = ${POSTFIX_domains}/g" "/etc/postfix/main.cf")"
echo "$postfix_emails" > /etc/postfix/main.cf
postfix_networks="$(sed "/mynetworks/c\mynetworks = ${POSTFIX_networks}" "/etc/postfix/main.cf")"
echo "$postfix_networks" > /etc/postfix/main.cf

## Sets the mapping table
echo -e "$POSTFIX_mappings" > /etc/postfix/virtual
/usr/sbin/postmap /etc/postfix/virtual
