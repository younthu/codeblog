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

# 嵌套套餐创建

~~~ruby
#  params: {
#  package: {value: 1, value2: 2,....},
#  child)packages: [{value: 3, value2: 4,....},{value: 5, value2: 6,....}]
#  }
  def create
    p = Package.create!(params.require(:package).permit(:title, :user_id, :price, :duration, :photos_number, :delivery_photos_number,
                                                        :description, :style, :feature, :clothes_number, :max_participant_number, :parent_id, photos:[]))
    if params[:child_packages]
      childrens_params = params.permit(child_packages: [:price, :photos_number, :delivery_photos_number, :clothes_number, :max_participant_number])
        childrens_params[:child_packages].each do |child_params|
        child = p.dup
        child.parent = p
        child.update(child_params)
      end

    end

    render json: p, include: :children
  end
~~~

# 模型校验

~~~ruby

  validate :duplicated_uid, on: :create
  
  def duplicated_uid
    uid = self.uid
    u = User.find_by uid:uid
    if u
      errors.add(:mobile, "手机号用户#{uid}已经存在，请勿重复创建会员。请通过手机号查找已经存在的会员，然后编辑会员信息.")
    end
  end

~~~


# 基础
1. What's the difference between a lambda, a block and a proc?
   1. Blocks与Procs的不同点
      * Procs是对象Object，但Block并不是一个对象，它只是一个代码段
      * 每个方法至多只能传递一个代码段，但可以传递多个Proc
   1. Proc和Lambda的异同
      ~~~ruby
      proc = Proc.new {puts "hello world"}
      lambda = lambda {puts "hello world"}

      proc.class  # rerturn 'Proc'
      lambda.class # return 'Proc'
      ~~~
       * 从上面可以看出，其实Proc和lambda都是Proc对象。
       * lambda会检查参数数量而proc则不会
          ~~~ruby
          lam = lambda { |x| puts x}
          lam.call(2)  # print 2
          lam.call  # ArgumentError: wrong number of arguments (0 for 1)
          lam.call(1,2) # ArgumentError: wrong number of arguments (2 for 1)

          pro = Proc.new {|x| puts x}
          proc.call(2)  # print 2
          proc.call    # return nil
          proc.call(1,2) # print 1
          ~~~
        * lambda和proc对'return'关键字的含义不一样,而且proc的return只能在方法体中调用
           ~~~ruby
            def lambda_test
              lam = lambda { return }
              lam.call
              puts "hello"
            end

            lambda_test   # puts 'hello'

            def proc_test
              pro = Proc.new {return}
              proc.call
              puts 'hello'
            end

            proc_test  # return nil  不打印hello
           ~~~

    1. [Ruby面试题](http://yu66.vip/doc/ruby/013-ruby%E9%9D%A2%E8%AF%95%E9%A2%98.html)
    2. [Ruby元编程中文](http://deathking.github.io/metaprogramming-in-ruby/chapter01.html)