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

# 内容按特定key分组

~~~ruby
    @uer = current_user
    @sess = Message.where(sender:@user).or(Message.where(receiver:@uer)).group_by(&:session_id)
    render json:sess, include: [:sender, :receiver, :payload]
~~~

得到按session_id分组的内容，注意，它会自动分组，还支持include方法。

# 检测字段重复

~~~ruby
class User < ApplicationRecord
   validate :duplicated_uid

   private
     def duplicated_uid
    uid = self.uid
    u = User.find_by uid:uid
    if u
      errors.add(:mobile, "手机号用户#{uid}已经存在，请勿重复创建会员。")
    end
  end
end

~~~

1. How to fail model validation.
   ~~~ruby
    def something
      errors.add(:base, 'error message') # 有error的情况下active record就不会保存。
    end
   ~~~

   自定义错误信息
   ~~~ruby
   validates :name, uniqueness: {
      message: ->(object, data) do
        "#{data[:value]} is taken already! See this shoe here #{Shoe.find_by({name: data[:value]}).url}"
      end
    }
   ~~~

   ~~~ruby

     before_save :check_required_fields
     private
      def check_required_fields()
        # 如果一开卡,则必须要有开卡日期
        if self.status.to_sym == :normal
          if not self.start_at.present?
            self.errors.add(:start_at, "开卡必须填开卡日期")
          end
        end
      end
   ~~~