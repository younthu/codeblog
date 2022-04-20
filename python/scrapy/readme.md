# 创建一个工程
scrapy startproject projectname

# 创建spider
scrapy genspider <爬虫名> <domain>

#创建crawler
scrapy genspider -t crawl <爬虫名> <domain>

# 查看工程里面有哪些爬虫
scrapy list

# 查看爬取的页面在浏览器里面的样子
scrapy view https://www.baidu.com

# 判断我们写的parse是否正确
scrapy parse https://www.baidu.com
scrapy parse --spider=wenzhaihui -c parse_xiaohua -v http://www.wenzhaihui.com/xiaohua/youmoxiaohua/2019-04-21/17570.html # 测试爬虫wenzhaihui里面的parse_xiaohua方法, -v 是一个开关，表示打印详细信息

# 运行爬虫, 需要在爬虫项目下进行
scrapy crawl spidername

# 运行爬虫, 不需要爬虫项目，只要有爬虫定义文件就可以了
scrapy runspider <spider_file.py>

# 在shell里面爬取页面
scrapy shell <page_url>
# UNIX-style
scrapy shell ./path/to/file.html
scrapy shell ../other/path/to/file.html
scrapy shell /absolute/path/to/file.html

# File URI
scrapy shell file:///absolute/path/to/file.html

# shell 里面response获取元素, XPath
response.xpath('//*[@id="kkpager"]/div/span/a/@href').extract()
response.xpath('//*[@id="kkpager"]/div/span/a/@href').extract_first()
response.xpath('string(//*[@id="kkpager"]/div)').extract()           # 提取第一个匹配节点下所有文本(包括子节点), 只返回第一个匹配的node下面的文本
response.xpath('//*[@id="kkpager"]/div/child::text()').extract()     # 提取所有匹配的节点
response.css('.shout').xpath('./time/@datetime').extract()           # 利用css来筛选特定class的元素
"".join(response.css('#article div.path *::text').extract())                                 # 获取某div的innerText
"".join(response.xpath("//div[@id='article']/div[@class='path']//child::text()").extract())  # xpath 方法获取某div的innerText,效果和上面的css效果一样

# 在chrome inspect下测试xpath
$x('//*[@id="kkpager"]/div/span/a/@href')


# 我们可以自定义Item Pipeline，只需要实现指定的方法，其中必须要实现的一个方法是： process_item(item, spider)。
# 另外还有如下几个比较实用的方法。
# open_spider(spider)。
# close_spider(spider)。
# from_crawler(cls, crawler)。
#


# 在运行 crawl 时添加 -a 可以传递Spider参数:
scrapy crawl myspider -a category=electronics
import scrapy

class MySpider(Spider):
    name = 'myspider'

    def __init__(self, category=None, *args, **kwargs):
        super(MySpider, self).__init__(*args, **kwargs)
        self.start_urls = ['http://www.example.com/categories/%s' % category]
        # ...


# 爬取的结果以json/jsonl/xml/csv格式输出, json输出的时候会出现unicode码，解决办法是设置FEED_EXPORT_ENCODING='utf-8'
# custom_settings={
#        "FEED_EXPORT_ENCODING":'utf-8', # 保证json输出不是默认的safe numeric encoding(\uXXX序列), http://doc.scrapy.org/en/master/topics/feed-exports.html#feed-export-encoding
#        }
scrapy crawl argos -o result.json
scrapy crawl argos -o result.jsonl
scrapy crawl argos -o result.xml
scrapy crawl argos -o result.csv

# response
response.text # 页面文本
response.body #页面返回的二进制数据
i['title']=response.xpath('//*[@id="article"]/h1/text()').extract_first()