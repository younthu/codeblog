1. 在js里面启动repl 并且等待chrome dev tool的连接
   ~~~js
   #! /usr/bin/env node --inspect 
    var repl = require('repl')

    repl.start()
   ~~~

1. 手动重新加载代码
  ~~~js
  delete require.cache["./TCPClient.js"];var sdk = require('./hello.js');
  ~~~