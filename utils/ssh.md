1. 通过ssh远程查看日志文件
ssh -t tekapic tail -f /var/www/Tekapic-Server/log/production.log
ssh -t tekapic "cd /var/www/Tekapic-Server/ && bundle exec rails c -e production"
