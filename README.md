
# Flask WebApp
This is a solution for the Ansible Assignment on Udemy https://www.udemy.com/learn-ansible-advanced

<a href="https://github.com/sogyals429/ansible-web-app/blob/master/LICENSE">
	<img src="https://img.shields.io/github/license/sogyals429/ansible-web-app" alt="License">
</a>

<div>

<p>This web app which can be deployed to any Virtual Machine</p>

</div>

<p>

</a>

</p>

```
.
├── Makefile
├── README.md
├── ansible.cfg
├── azure-pubkey.pem
└── playbooks
    ├── group_vars
    │   └── all.yml
    ├── inventory
    │   ├── inventory.txt
    │   └── myazure_rm.yml
    ├── main.yml
    └── roles
        ├── common
        │   └── tasks
        │       └── main.yml
        ├── db
        │   └── tasks
        │       └── main.yml
        ├── lb
        │   ├── tasks
        │   │   └── main.yml
        │   └── templates
        │       └── nginx.conf.j2
        └── web
            ├── tasks
            │   └── main.yml
            └── templates
                ├── app.py.j2
                ├── nginx.conf.j2
                ├── proxy.conf.j2
                ├── start_service.sh.j2
                └── web_app.service.j2

```
# Prerequisites
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) 
- Virtual Machines (VirtualBox or Cloud Providers)
  

## How to implement
- Clone the repository [git@github.com:sogyals429/ansible-web-app.git]
- Update the following variables in `group_vars/all.yml`:
	- db_user
	- db_user_password
	- gmail_password
	- gmail_username
	- to_email
> Note:  these values need to be encrypted using Ansible vault. You will need to encrypt each value one by one. To encrypt follow the steps below:
```
ansible-vault encrypt_string 'VALUE' --name 'db_user'
```
> The value for the name parameter is the actual variable name you can reference in the playbook.
- After encryption paste the output of each encryption in the `group_vars/all.yml`. The value should be similar to 
```
gmail_username:  !vault  |
$ANSIBLE_VAULT;1.1;AES256
61343235653635366234326237343638653563306239313161393361623564616666366532363833
```

- You will also need to add a variable which specifies your database name `db_name`. I haven't encrypted the value as it is not sensitive. 
- If you are using cloud provider you can download a dynamic inventory script which can easily bring all your resources and not require you to define them manually using an inventory file. More about that [here](https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html)
- You can also manually specify the inventory file which is under `playbooks/inventory/inventory.txt`. You will need to update `ansible_host`, `ansible_ssh_private_key_file` and `ansible_user`. If you are using password based authentication on your virtual machine you can replace `ansible_ssh_private_key_file` for `ansible_ssh_pass`.
- In `playbooks/main.yml` update the hosts accordingly to the type of inventory you use.
- Once all values are updated execute `make web` or `make simple_web` based on what kind of inventory you use.

## Issues
For any issues please raise any PR's or raise issues in this project.

## Want to Help?

Feel free to make an PR's or raise any issues 😍

## License

This project is licensed under the MIT License - see the  [LICENSE.md](https://gist.github.com/PurpleBooth/LICENSE.md)  file for details