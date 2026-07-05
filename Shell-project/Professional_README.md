
# 🍕 PizzaHub DevOps Project

End-to-end Shell Scripting + Nginx + CGI + Email Automation project built on Amazon Linux.

---

## 🚀 Features

- Dynamic pizza ordering website
- CGI shell scripting backend
- Order logging
- Email notifications
- Delayed email scheduling using `at`
- Gmail SMTP integration using `msmtp`
- Nginx + fcgiwrap CGI execution
- Automated deployment scripts
- Production-ready troubleshooting guide

---

## Architecture

```text
User
 ↓
Website
 ↓
order.sh
 ↓
orders.txt
 ↓
send_received.sh
 ↓
scheduler.sh
 ↓
at daemon
 ↓
send_preparing.sh (5 mins)
 ↓
send_completed.sh (10 mins)
 ↓
msmtp
 ↓
Gmail SMTP
```

---

## Project Structure

```text
Shell-project/
│
├── website/
├── nginx/
├── install-dependencies.sh
├── deploy.sh
├── permissions.sh
├── order.sh
├── send_received.sh
├── send_preparing.sh
├── send_completed.sh
├── scheduler.sh
├── orders.txt
└── msmtprc.template
```

---

## Technologies Used

- Bash Shell
- Nginx
- fcgiwrap
- CGI
- at daemon
- msmtp
- Gmail SMTP
- Amazon Linux 2023

---

## Installation

```bash
sudo sh install-dependencies.sh
sudo sh permissions.sh
sudo sh deploy.sh
```

---

## Nginx CGI Configuration

```nginx
location ~ ^/cgi-bin/(.*\.sh)$ {
    gzip off;
    include fastcgi_params;

    fastcgi_param SCRIPT_FILENAME /usr/lib/cgi-bin/$1;

    fastcgi_pass unix:/run/fcgiwrap/fcgiwrap-nginx.sock;
}
```

---

## Socket Fix

Create:

```text
/etc/systemd/system/fcgiwrap@nginx.socket.d/override.conf
```

Contents:

```ini
[Socket]
SocketUser=nginx
SocketMode=0666
```

Reload:

```bash
sudo systemctl daemon-reload
sudo systemctl restart fcgiwrap@nginx.socket
sudo systemctl restart nginx
```

---

## Email Configuration

Edit:

```bash
sudo vi /etc/msmtprc
```

Template:

```conf
defaults
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-bundle.crt

account gmail
host smtp.gmail.com
port 587
from YOUR_EMAIL
user YOUR_EMAIL
password YOUR_16_CHARACTER_APP_PASSWORD

account default : gmail
```

---

## Common Issues Solved

### 502 Bad Gateway

Cause:
fcgiwrap socket permissions.

Fix:

```bash
sudo systemctl restart fcgiwrap@nginx.socket
sudo systemctl restart nginx
```

### Emails not sent

Verify:

```bash
sudo systemctl status atd
atq
```

---

## Lessons Learned

- Difference between cron and at
- CGI execution through Nginx
- Socket permissions debugging
- msmtp SMTP configuration
- Systemd socket activation
- Shell scripting automation

---

## Future Improvements

- Dockerize application
- Add Jenkins CI/CD
- Terraform infrastructure
- AWS SES integration
- Monitoring with Prometheus

