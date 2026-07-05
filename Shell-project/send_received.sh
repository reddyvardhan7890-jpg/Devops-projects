#!/bin/bash

EMAIL=$1

SUBJECT="Order Received - PizzaHub"

BODY="Hi,

Your order has been received.

Thank you for ordering."

{
echo "Subject: $SUBJECT"
echo
echo "$BODY"
} | msmtp "$EMAIL"