# secure token

# 查找association为空的记录

~~~ruby
# http://www.chrisrolle.com/en/blog/finding-records-without-associations
Moment.left_joins(:censor).where(censors:{id: nil} )
~~~

允许delegate到nil对象，返回nil
~~~ruby
delegate :status, to: :censor, allow_nil: true
~~~