## Selfhosted email forwarding

Simple, lightweight and straightforward selfhosted mail forwarding with Docker and Postfix

### Environment variables

**POSTFIX_hostname**: Hostname that will be published in the message headers
**POSTFIX_mail_name**: The mail system name that is displayed in Received: headers, in the SMTP greeting banner, and in bounced mail.
**POSTFIX_domains**: Domains where you want your email forwarded. In the examples below, the domains would be ``domain.com`` and ``example.com``
**POSTFIX_networks**: Networks postfix will listen to
**POSTFIX_mappings**: Mappings for your domain

#### Mappings examples
You can combine mappings as much as you want:

**Forwards all the emails received to your domain to ``example@gmail.com``**

``@domain.com example@gmail.com``

**Forwards all the emails from ``hello@domain.com`` to ``example@gmail.com`` and ``test@gmail.com``**
**Forwards ``office@domain.com`` to ``office@gmail.com``**
**Forwards all the emails sent to the ``example.com`` domain to ``personal@gmail.com``**

```
hello@domain.com example@gmail.com test@gmail.com
office@domain.com office@gmail.com
@example.com personal@gmail.com
``` 

##### How to set up the mappings in the environment variable
Use the ``\n`` escaping character for new lines. The 2nd example above would be like this in the docker CLI:

``-e POSTFIX_mappings="hello@domain.com example@gmail.com test@gmail.com\noffice@domain.com office@gmail.com\n@example.com personal@gmail.com"``

## Disclaimer

Selfhosting email is pretty difficult and most ISP blocks port 25. Mine didn't and I had the chance to test this for some time.
However, is really easy for attackers to distribute spam using your smtp server and it could lead to your IP being blocked in Gmail or Outlook
due to bad reputation.

USE IT AT YOUR OWN RISK
