
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

1. 提交空的commit,  触发github pages 重新编译, 亲测可用, [该博客](http://blog.ilibrary.me/2020/09/09/%E7%94%A8convert%E8%A3%81%E5%89%AA%E5%9B%BE%E6%A0%87)遇到过这个问题, 第一次提交没有生成新的页面，后来提交空内容生成了新页面: 
   ~~~sh
   git commit --allow-empty -m "Trigger rebuild"
   git push
   ~~~