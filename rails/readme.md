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