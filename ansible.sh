component=$1
env >/tmp/env
#ansible-playbook -i $component-$env.janand.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e env=$env -e role_name=$component expense.yml
