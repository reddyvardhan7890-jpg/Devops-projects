#!/bin/bash

echo "Content-Type: text/html"
echo ""

read POST_DATA

EMAIL=$(echo "$POST_DATA" | cut -d'=' -f2 | sed 's/%40/@/')

BASE_DIR="/usr/lib/cgi-bin"

DATE=$(date)

echo "$EMAIL | $DATE" >> /usr/lib/cgi-bin/orders.txt

bash $BASE_DIR/send_received.sh "$EMAIL"

bash $BASE_DIR/scheduler.sh "$EMAIL"

cat <<EOF
<html>
<head>
<title>PizzaHub</title>
</head>

<body>

<h1>🍕 PizzaHub</h1>

<h2>Order placed successfully!</h2>

<p>Email notifications scheduled.</p>

<a href="/">Back to Menu</a>

</body>
</html>
EOF
