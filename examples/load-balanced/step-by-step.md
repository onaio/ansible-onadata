# Step by Step fresh setup of Onadata

1. Initial load-balanced Server Setup
2. Deployment Environment Setup
3. Create inventories from template
4. Edit the inventories/[environment] variables to match the servers
5. Deploy the services

## 1. Initial load-balanced Server Setup

Install Ubuntu Server 18.04 in four servers. See purpose of servers
at [Onadata Load-Balanced Setup](./README.md). Note down the IPs for the four
servers.

## 2. Deployment Environment Setup

Install Ansible 2.8+ in a python 3 environment.

```sh
# Install virtualenv
pip install --user virtualenv

# Ensure ~/.local/bin is in your environment
export PATH=~/.local/bin:$PATH

# Create a Python 3 virtual environment
mkdir -p ~/.virtualenvs
virtualenv -p python3 ~/.virtualenvs/playbooks
source ~/.virtualenvs/playbooks/bin/activate

# Install Ansible 2.8 or later
pip install "ansible>=2.8"
```

Get the latest playbooks to start with.

```sh
git clone git@github.com:onaio/ansible-onadata.git
cp -r ansible-onadata/examples/load-balanced playbooks
cd playbooks
```
Ensure you have the latest ansible roles installed. Include `-f` option to
reinstall and force for an update of the roles.

```sh
ansible-galaxy install -r requirements.yml -p roles [-f]
```

## 3. Create inventories from template

Copy the inventory directory into an inventories/[environment]. It is possible
to use the same playbooks for multiple environments.

```sh
mkdir -p inventories
cp -r inventory inventories/[environment]
```

## 4. Edit the inventories/[environment] variables to match the servers

Edit inventories/[environment]/group_vars/all/vars.yml and set the server IP for
each service accordingly. Update the variables `example_postgresql_host`,
`example_ancillary_host`, `example_api_host_0`, `example_api_host_1` and set the
IP for the four servers accordingly. Edit `*_user` and `*_password` variables
accordingly, for example you can update the `postgresql_onadata_password`
variable. You would want to use only the LAN/private IP for this hosts. If you
are not on the same LAN as the servers, you should set the public IPs to the
servers via the `*_ssh_host` variables.

## 5. Deploy the services

Deploy all services all at once or one by one.

```sh
ansible-playbook -i inventories/[environment] deploy-everything.yml
```

When deploying servers one by one the order of deployment is:

i. PostgreSQL: you may need to run it a second time if it fails the first time.

```sh
ansible-playbook -i inventories/[environment] postgresql.yml
```

ii. RabbitMQ

```sh
ansible-playbook -i inventories/[environment] rabbitmq.yml
```

iii. Memcached

```sh
ansible-playbook -i inventories/[environment] memcached.yml
```

iv. Onadata

```sh
ansible-playbook -i inventories/[environment] onadata.yml
```
