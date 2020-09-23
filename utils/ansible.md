Ansible 不需要装client, 通过ssh远程操控机器，非常方便。

1. 定义inventory, 把下面内容放到当前目录下`./hosts`里面: 
   ~~~
   # /etc/ansible/hosts
   # 直接指定ip
   192.168.1.4  ansible_user=ubuntu ansible_ssh_private_key_file=~/sourcecode/.private/zhiyongmacsshkey/id_rsa

   [server1]
    52.199.86.20 ansible_user=ubuntu ansible_ssh_private_key_file=~/sourcecode/.private/zhiyongmacsshkey/id_rsa

   [yoga]
    yoga.ilibrary.me ansible_port=2233 ansible_user=dev ansible_ssh_private_key_file=~/sourcecode/.private/zhiyongmacsshkey/id_rsa #yoga.ilibrary.me
   ~~~
1. 查看远程目录: `ansible yoga -i ./hosts -m command -a "ls -l"` 或者 `ansible yoga -m command -a "ls /var/yoga"`
1. 直接通过ip ping, 需要把ip加入到hosts里面去: `ansible 192.168.1.4 -m ping`
1. 查看主机名: `ansible 192.168.1.4 -m command -a "hostname"`
1. 切换路径: `ansible yoga -m command -a "git pull chdir=/var/xxxx"` # 在/var/xxx目录下执行`git pull`