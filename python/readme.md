# 2重推导
sentences = ["Hello World", "Nice to meet you"]
[x for s in sentences for x in s]

遵循先定义后使用的原则， `for s in sentences`在前面, `for x in s`用到了前面用到的 s.