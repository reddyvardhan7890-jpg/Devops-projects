#!/bin/bash

EMAIL=$1

echo "/bin/bash /usr/lib/cgi-bin/send_preparing.sh $EMAIL" | SHELL=/bin/bash at now + 5 minutes

echo "/bin/bash /usr/lib/cgi-bin/send_completed.sh $EMAIL" | SHELL=/bin/bash at now + 10 minutes