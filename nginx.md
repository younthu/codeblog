1. 修改客户端文件上传大小限制: 
   ~~~
   server {
       ...
        client_max_body_size 100m;
        ...
   }
   ~~~