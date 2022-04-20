# 2重推导
sentences = ["Hello World", "Nice to meet you"]
[x for s in sentences for x in s]

遵循先定义后使用的原则， `for s in sentences`在前面, `for x in s`用到了前面用到的 s.

第四：python GIL
　　GIL是Python最为诟病的一点，因为GIL，python中的多线程并不能真正的并发。如果是在IO bound的业务场景，这个问题并不大，但是在CPU BOUND的场景，这就很致命了。所以笔者在工作中使用python多线程的情况并不多，一般都是使用多进程（pre fork），或者在加上协程。即使在单线程，GIL也会带来很大的性能影响，因为python每执行100个opcode（默认，可以通过sys.setcheckinterval()设置）就会尝试线程的切换，具体的源代码在ceval.c::PyEval_EvalFrameEx。


1. for else; while else
1. 