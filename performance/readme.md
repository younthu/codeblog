# 常用性能监控工具
APM，全称：Application Performance Management. 

知乎上有一篇(开源APM的讨论](有什么知名的开源apm(Application Performance Management)工具吗？ - 刀把五的回答 - 知乎
https://www.zhihu.com/question/27994350/answer/118821214).

1. newrelic
2. 国产OneAPM
3. [Sentry](https://github.com/getsentry/sentry) is cross-platform application monitoring, with a focus on error reporting. https://sentry.io. 开源。服务器用python写的,客户端支持各种语言。
4. 大众点评[CAT](https://github.com/dianping/cat), 开源Apache.支持java,c,c++,python, go, node.js。 不支持PHP,C#, Ruby. 不支持移动端。由开发人员埋点，侵入式的。
5. [Pinpoint](https://github.com/naver/pinpoint), 开源，Apache.   用Java/PHP写的。

## 微信小程序监控

1. [ARMS微信小程序监控](https://help.aliyun.com/document_detail/103992.html?spm=a2c4g.11186623.6.605.195a33b7ROXRgP)

# 压力测试工具

1. ab: `ab -n 10000 -c 100 http://localhost:8080/hello`
2. `ab -n 1000000 -c 100 -p data.txt -T 'application/x-protobuf'  'http://www.xxxxx.com/'`, 命令表示模拟100个并发用户，持续300秒发送POST请求到http://www.xxxxx.com/，POST数据从文件data.txt读取，Content-type为application/x-protobuf。
3. siege: `siege -c 100 -t 10S https://baidu.com`, 100并发，持续10秒