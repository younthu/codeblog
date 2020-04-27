
1. 取消gpg签名:
如果遇到下面的错误，可以取消gpg签名:
~~~
error: gpg failed to sign the data
fatal: failed to write commit object
~~~

取消gpg签名: 
~~~
# 把下面内容加入到.git/config里面去
[commit]
	gpgsign = false
~~~