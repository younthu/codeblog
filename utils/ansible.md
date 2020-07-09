Ansible 不需要装client, 通过ssh远程操控机器，非常方便。

1. 定义inventory, 把下面内容放到当前目录下`./hosts`里面: 
   ~~~
   [server1]
    52.199.86.20 ansible_user=ubuntu ansible_ssh_private_key_file=~/sourcecode/.private/zhiyongmacsshkey/id_rsa
   ~~~
1. 查看远程目录: `ansible dgapp -i ./hosts -m command -a "ls -l"`