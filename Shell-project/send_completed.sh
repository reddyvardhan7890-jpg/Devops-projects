#!/bin/bash

EMAIL=$1

SUBJECT="Order Completed - PizzaHub"

BODY="Hi,

Your order is ready and completed.

Enjoy your meal!

Thanks for ordering."

{
echo "Subject: $SUBJECT"
echo
echo "$BODY"
} | msmtp "$EMAIL"