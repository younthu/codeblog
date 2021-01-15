config.comments_registration_name = 'AdminComment'

# extend active admin css/js
https://github.com/activeadmin/activeadmin/issues/3819#issuecomment-351377822

核心要点是记得删除原来app/assets/下的两个原文件(javascript/active_admin.js, stylesheets/active_admin.css).
否则，覆盖不会起作用，因为框架优先寻找app/下面的资源.


# 连接远程数据库做管理