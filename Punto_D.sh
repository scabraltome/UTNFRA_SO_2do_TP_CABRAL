ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.56.12
