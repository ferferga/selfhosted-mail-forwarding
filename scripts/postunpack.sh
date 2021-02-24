#!/bin/bash

## Redirect output to stdout and stderr
echo -e "\n## Logging settings" >> /etc/postfix/main.cf
echo "maillog_file = /dev/stdout" >> /etc/postfix/main.cf
echo -e "\n" >> /etc/postfix/main.cf

## Add template to postfix config file
echo "## Virtual alias settings" >> /etc/postfix/main.cf
echo "virtual_alias_domains = localhost" >> /etc/postfix/main.cf
echo "smtpd_reject_unlisted_recipient = yes" >> /etc/postfix/main.cf
echo "virtual_alias_maps = hash:/etc/postfix/virtual" >> /etc/postfix/main.cf

postfix_config="$(sed '/mydestination/c\mydestination = $myhostname' "/etc/postfix/main.cf")"
echo "$postfix_config" > /etc/postfix/main.cf

## Create mappings file
touch /etc/postfix/virtual
chown root:root -R /etc/postfix
