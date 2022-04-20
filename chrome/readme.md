1. 保存console里面输出的内容
    1. 右键->另存为
    1. 或者用下面的代码
       ~~~js
       (function(console){
        console.save = function(data, filename){

            if(!data) {
                console.error('Console.save: No data')
                return;
            }

            if(!filename) filename = 'console.json'

            if(typeof data === "object"){
                data = JSON.stringify(data, undefined, 4)
            }

            var blob = new Blob([data], {type: 'text/json'}),
                e    = document.createEvent('MouseEvents'),
                a    = document.createElement('a')

            a.download = filename
            a.href = window.URL.createObjectURL(blob)
            a.dataset.downloadurl =  ['text/json', a.download, a.href].join(':')
            e.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null)
            a.dispatchEvent(e)
        }
        })(console)
       ~~~

# 在console里面爬https://gs.amac.org.cn/amac-infodisc/res/pof/manager/managerList.html的api
它的api会校验一些头。

~~~js
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
var ret = []
for(var i = 0; i < 2463; i++) {
    let page = await fetch(`https://gs.amac.org.cn/amac-infodisc/api/pof/manager/query?rand=0.634780262593176&page=${i}&size=10`, {
  "headers": {
    "accept": "application/json, text/javascript, */*; q=0.01",
    "accept-language": "en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,zh-TW;q=0.6,ja;q=0.5,ko;q=0.4",
    "content-type": "application/json",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin",
    "x-requested-with": "XMLHttpRequest"
  },
  "referrer": "https://gs.amac.org.cn/amac-infodisc/res/pof/manager/managerList.html",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": "{}",
  "method": "POST",
  "mode": "cors",
  "credentials": "include"
});
let data = await page.json()
let j = data.content
ret.push(j)
await sleep(50)
}
~~~