# puma启动失败, No such file or directory - connect(2) for "/var/www/current"

该问题发生在docker容器重新做,改变了工作目录， container重新做好以后共享了shared目录。shared/puma.rb残留有上一次成功部署的路径。删除shared/puma.rb即可.

# assets目录下的内容无法正常加载
验证: 在host下面，cd到 nginx config的root路径，失败。

docker下用cap部署，会生成一个current的symbol link, 会指向容器内的一个地址，如果nginx在host里面，可能会找不到current指向的地址。解决办法，container的路径结构和host的路径结构保持一致。

改好以后记得重启nginx.
