1. 读取第8列所有的行: `df.iloc[:, 8]`
1. 读取列名为`ActionUK`的所有记录: `df['ActionUK']`
1. 遍历所有行: 
  ~~~python
  for _, row in df.iterrows():
    navigationId=row[8] # 获取当前行的第8列的值
  ~~~
1. 从第6行开始解析excel文件: `df = pd.read_excel("./Dev-Priority-list.xlsx", skiprows=5)`
1. 
