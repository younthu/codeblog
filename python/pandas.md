1. 读取第8列所有的行: `df.iloc[:, 8]`
1. 读取列名为`ActionUK`的所有记录: `df['ActionUK']`
1. 遍历所有行: 
  ~~~python
  for _, row in df.iterrows():
    navigationId=row[8] # 获取当前行的第8列的值
  ~~~
1. 从第6行开始解析excel文件: `df = pd.read_excel("./Dev-Priority-list.xlsx", skiprows=5)`
1.  从多个文件中抽取同一个列，并输出到一个csv文件:

    方法1， 通过ndarray来操作
    ~~~python
    import pandas as pd
    import numpy as np
    result = []
    import os
    for file in os.listdir("./"): # 遍历当前目录
        if file.endswith(".csv"): # 读取csv文件
            df = pd.read_csv(file)
            nd_arr = df['SerialNum'].to_numpy() # dataframe to ndarray
            result = np.append(result, nd_arr) # 追加文件内容

    print(result)
    unique_data = np.unique(result) # 去重
    pd.DataFrame(unique_data).to_csv('sns2.csv.txt')  #保存
    ~~~

   方法2, dataframe直接操作
   ~~~python
    import pandas as pd
    import numpy as np
    result = pd.DataFrame()
    for file in os.listdir("./"): # 遍历当前目录
        if file.endswith(".csv"): # 读取csv文件
            df = pd.read_csv(file)
            result = pd.concat([result, df[['SerialNum','AssyHWRev']]])

    print(result.drop_duplicates())
    uniq_df = result.drop_duplicates()
    uniq_df.to_csv('sns3.csv')
   ~~~