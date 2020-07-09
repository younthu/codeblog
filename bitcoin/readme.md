1. 比特币钱包随机数长度为256bit, 2**256 ≈ 10 ** 77
2. 从私钥计算出来的公钥是一个平面上的点，是由(x, y)坐标来表示的。那么一个公钥长度就是256+256=512位。
3. 比特币钱包地址 = RIPEMD160(SHA256(公钥)), 长度为160bit.
4. CPU、GPU 都属于冯·诺依曼结构，指令译码执行、共享内存。FPGA之所以比 CPU 甚至 GPU 能效高，本质上是无指令、无需共享内存的体系结构带来的福利。
5. 2016 年 9 月,Catapult 项目的老大 Doug Burger 在 Ignite 2016大会上与微软 CEO Satya Nadella 一起做了 FPGA 加速机器翻译的演示。演示的总计算能力是 103 万 T ops，也就是 1.03 Exa-op，相当于 10 万块顶级 GPU 计算卡。一块 FPGA（10 CPU cores + 4 FPGAs, 加上板上内存和网络接口等）的功耗大约是30 W，仅增加了整个服务器功耗的十分之一。
6. 2019.8.22, [VU19P](https://china.xilinx.com/news/media-kits/xilinx-announces-the-worlds-largest-fpga.html) 拥有 350 亿个晶体管,2013年酷睿i7 4960X，制作工艺22nm，晶体管数量18.6亿。[24核的志强，72亿晶体管](https://www.fool.com/investing/2016/06/13/intel-corporation-reveals-interesting-fact-about-n.aspx). A13拥有约85亿个晶体管. 麒麟990有103亿晶体管.
7. [https://brd.com/blog/large-bitcoin-collider](https://brd.com/blog/large-bitcoin-collider)
8. [LBC, Large Bitcoin Collider](https://lbc.cryptoguru.org/about)
9. [LBC 奖品池](https://lbc.cryptoguru.org/trophies), 2017年以后就没有更新过了。
10. 2017-03-25, LBC, 搜索速度为500 Mkeys/s. 最开始的时候只有0.15 Mkeys/s. 2017-10-30为止搜索了超过8000 tn keys.
11. 开源的FPGA算法库, [Open-Source FPGA Bitcoin Miner](https://github.com/progranism/Open-Source-FPGA-Bitcoin-Miner)。


参考:

1. [比特币私钥为什么可以保证安全性？](https://boolwallet.com/index.php/2019/10/14/%E6%AF%94%E7%89%B9%E5%B8%81%E7%A7%81%E9%92%A5%E4%B8%BA%E4%BB%80%E4%B9%88%E5%8F%AF%E4%BB%A5%E4%BF%9D%E8%AF%81%E5%AE%89%E5%85%A8%E6%80%A7%EF%BC%9F/)
2. [](https://www.msra.cn/zh-cn/news/features/fpga-20170111)