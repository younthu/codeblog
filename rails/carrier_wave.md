# undefined method `reject' for #<String

如果遇到下面的错误:

~~~
undefined method `reject' for #<String
~~~
在`photo.rb`里面加入:

~~~ruby
    mount_uploaders :photos, PhotoUploader
    serialize :photos, JSON  # 加入这一行
~~~