  
# HTTPS server
# 创建目录/etc/nginx/cert, 然后将证书文件拷贝到该目录下
# 以下属性中以ssl开头的属性代表与证书配置有关，其他属性请根据自己的需要进行配置。
# 
# 调试: 
# 部署好以后记得打开阿里云的端口，要不然会没有响应的.
# 如果没有响应, 还可以看/var/log/nginx/access.log是否有请求过来。
server {
    listen 443 ssl;   #SSL协议访问端口号为443。此处如未添加ssl，可能会造成Nginx无法启动。
    server_name localhost;  #将localhost修改为您证书绑定的域名，例如：www.example.com。
    root html;
    index index.html index.htm;
    ssl_certificate cert/domain name.pem;   #将domain name.pem替换成您证书的文件名。
    ssl_certificate_key cert/domain name.key;   #将domain name.key替换成您证书的密钥文件名。
    ssl_session_timeout 5m;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;  #使用此加密套件。
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;   #使用该协议进行配置。
    ssl_prefer_server_ciphers on;   
    ssl on; # 注意这一行得加上，不加上会导致ERR_SSL_PROTOCOL_ERROR, 
    
    try_files $uri @rails;
    location @rails {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host; # 域名转发, app可以正确识别用户访问到域名.
        proxy_set_header X-Real-IP $remote_addr;
        proxy_redirect off;
    }
}   