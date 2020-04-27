# shell

~~~shel
mkdir src/app
cd $_
~~~

# 全站爬取

~~~shell
wget --recursive http://google.com
~~~


1. 查看当前目录下各个一级子目录大小: `du -h -d 1`, 该命令会统计各个一级子目录所占空间大小.
2. 删除所有的`node_modules`目录, 目录遍历深度为4: `find . -type d -name node_modules -d 4 -exec rm -rf '{}' \;`