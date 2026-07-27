# Prerequisites

## 1. Launch the Ansible Control Node

Create an EC2 instance manually using:

- OS: Red Hat Enterprise Linux 9
- Instance Type: t3.micro
- Key Pair: Ansible-project
- Security Group: Allow SSH (22)
- IAM Role: EC2FullAccess (or equivalent permissions)

---

# Install Required Packages

```bash
sudo dnf install ansible-core -y
sudo dnf install python3-pip -y

sudo /usr/bin/python3 -m pip install boto3 botocore

ansible-galaxy collection install amazon.aws
ansible-galaxy collection install community.general
```

---

# Clone the Repository

```bash
git clone https://github.com/reddyvardhan7890-jpg/Devops-projects.git

cd Devops-projects/"Ansible project"
```

---

# Verify AWS Credentials

```bash
aws sts get-caller-identity
```

Expected output:

```json
{
    "UserId": "...",
    "Account": "...",
    "Arn": "..."
}
```

---

# Verify Ansible

```bash
ansible --version
```

---

# Verify Inventory Connectivity

```bash
ansible all -i inventory.ini -m ping
```

Expected Output:

```text
mongodb-qa.daws88sonline.online | SUCCESS => {
    "ping": "pong"
}
```

---

# Create Infrastructure

```bash
ansible-playbook create.yml
```

---

# Configure Services

```bash
ansible-playbook -i inventory.ini mongodb.yml
ansible-playbook -i inventory.ini redis.yml
ansible-playbook -i inventory.ini catalogue.yml
ansible-playbook -i inventory.ini user.yml
ansible-playbook -i inventory.ini cart.yml
ansible-playbook -i inventory.ini shipping.yml
ansible-playbook -i inventory.ini payment.yml
ansible-playbook -i inventory.ini frontend.yml
```

---

# Destroy Infrastructure

```bash
ansible-playbook destroy.yml
```

---

# Troubleshooting

## Private key not found

If the control node was created using a different key pair, copy the required private key from your local machine.

```bash
scp -i ~/.ssh/movie-hub.pem \
~/.ssh/Ansible-project.pem \
ec2-user@<CONTROL_NODE_PUBLIC_IP>:/home/ec2-user/.ssh/
```

Set the correct permissions.

```bash
chmod 400 ~/.ssh/Ansible-project.pem
```

Verify.

```bash
ls -l ~/.ssh
```

Test SSH connectivity.

```bash
ssh -i ~/.ssh/Ansible-project.pem maintuser@<PRIVATE_IP>
```

Finally, verify Ansible connectivity.

```bash
ansible all -i inventory.ini -m ping
```