active_record下标访问支持表字段的访问, 不支持association的直接解析, 下表访问和read_attribute是同一个概念. send是通用的方法调用，包含了read_attribute.

大部分情况下，数据库字段操作应该用read_atttribute, write_attribute, 因为monkey_patch的问题, send会不确定性地失效。方法访问也一样.

~~~ruby
class Board < ApplicationRecord
  belongs_to :user

  belongs_to :p0, class_name: "Dog"
  belongs_to :p1, class_name: "Dog"
  belongs_to :p2, class_name: "Dog"
  belongs_to :p3, class_name: "Dog"
  belongs_to :p4, class_name: "Dog"
  belongs_to :p5, class_name: "Dog"
  belongs_to :p6, class_name: "Dog"
  belongs_to :p7, class_name: "Dog"
  belongs_to :p8, class_name: "Dog"
  belongs_to :p9, class_name: "Dog"
  belongs_to :p10, class_name: "Dog"
  belongs_to :p11, class_name: "Dog"

  def item_at(index) # index = 0
    self["p#{index}"]                   # 不工作, 返回nil
    self["p#{index}_id"]                # 工作, 返回p0.id
    self["p#{index}"] = nil             # 不工作,  unknown attribute
    self["p#{index}_id"] = 1            # 工作
    self.read_attribute "p#{index}"     # 不工作, 返回nil
    self.read_attribute "p#{index}_id"  # 工作, 返回id
    self.send "p#{index}"               # 工作, 返回p0
    self.send "p#{index}_id"            # 工作, 返回id
  end
end
~~~

# 在没有rails的情况下连接active_record
教程: [ruby-activerecord-without-rails-tutorial](https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial)

sample
~~~ruby
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.db')

class User < ActiveRecord::Base
end

# Create a new user object then save it to store in database
new_user = User.new(name: 'Dano', age: 30)
new_user.save

User.new { |u|
    u.name = 'NanoDano'
    u.age = 60
}.save

# Create and save in one step with `.create()`
User.create(name: 'John Leon', age: 90)
~~~