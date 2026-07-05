#!/bin/bash

EMAIL=$1

SUBJECT="Order Preparing - PizzaHub"

BODY="Hi,

Your order is now being prepared.

Thanks for waiting."

{
echo "Subject: $SUBJECT"
echo
echo "$BODY"
} | msmtp "$EMAIL"