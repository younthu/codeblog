# 常用性能监控工具
APM，全称：Application Performance Management. 

1. newrelic
2. 国产OneAPM
3. [Sentry](https://github.com/getsentry/sentry) is cross-platform application monitoring, with a focus on error reporting. https://sentry.io. 开源。服务器用python写的,客户端支持各种语言。


# 压力测试工具

1. ab: `ab -n 10000 -c 100 http://localhost:8080/hello`
2. `ab -n 1000000 -c 100 -p data.txt -T 'application/x-protobuf'  'http://www.xxxxx.com/'`, 命令表示模拟100个并发用户，持续300秒发送POST请求到http://www.xxxxx.com/，POST数据从文件data.txt读取，Content-type为application/x-protobuf。
3. siege: `siege -c 100 -t 10S https://baidu.com`, 100并发，持续10秒