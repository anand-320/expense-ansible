component=$1


rm -rf ~/*.json
ansible-playbook get-secrets.yml -e vault_token=$vault_token -e env=$env -e role_name=$component
# ansible-playbook -i $component-$env.janand.online, -e env=$env -e role_name=$component expense.yml -e '@~/secrets.json'

aws ec2 describe-instances --filters Name=tag:Name,Values=$component-$env Name=instance-state-name,Values=running --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text >inv
ansible-playbook -i inv -e env=$env -e role_name=$component expense.yml -e '@~/secrets.json'

rm -rf ~/*.json