
## Ona Data Load Balanced Setup



You can bring up the setup by running:

```sh
./bring-up.sh
ansible-galaxy install -r requirements.yml -p roles
ansible-playbook -i inventory deploy-everything.yml
```