config.comments_registration_name = 'AdminComment'

# extend active admin css/js
https://github.com/activeadmin/activeadmin/issues/3819#issuecomment-351377822

核心要点是记得删除原来app/assets/下的两个原文件(javascript/active_admin.js, stylesheets/active_admin.css).
否则，覆盖不会起作用，因为框架优先寻找app/下面的资源.


# 连接远程数据库做管理

1. 可选id列: `selectable_column`
1. 上传多个图片或者文件: 
   ~~~ruby
   permit_params pics: []

   form(:html => { :multipart => true })  do |f|
     # 这个可以选多个文件，不是多个输入框
    f.input :pics, as: :file, input_html: { multiple: true } # This multiple: true option is the thing that solves the problem as it changes the name of the form field from "model[column]" to "model[column][]"

   ~~~
1. 表单出错提示:
   ~~~ruby
    form do |f|
        f.semantic_errors
        # or
        f.semantic_errors *f.object.errors.keys
   ~~~
1. index 内嵌table
   ~~~ruby
       column :yoga_classes, label: "适用课程" do |ct|
      table_for ct.yoga_classes do |cls|
        column :id
        column :name
      end
    end
   ~~~
1. show 内嵌table
   ~~~ruby
   show do |user|
        panel "会员卡" do
            table_for user.cards do |table|
                column :card_number do |card|
                link_to card.card_number, admin_card_path(card)
                end
                column :card_type
                column :start_at
                column :due_at
                column :status do |card|
                {
                    normal: "正常",
                    created: "未开卡",
                    paused: "已停卡",
                    overdue: "已过期"
                }[card.status.to_sym]
                end
            end
        end
   end
   ~~~
1. column自定义标签(文字)
    ~~~ruby
    show do |user|
        panel "会员卡" do
            table_for user.cards do |table|
                column "会员类型", :card_type
                end
            end
        end
   end
    ~~~
1.  form 添加has_many,
    注意， polymorphic不工作. 可以把polymorphic放一个多对多关系模型里面去，下面的:package_items就是一个多对多， :packable就是polymorphic关系.
   ~~~ruby
    f.has_many :package_items, new_record: "添加项目", allow_destroy: true, heading: "项目" do |pi|
        pi.input :packable, collection: Item.all+Package.all, wrapper_html: {class: "col-xs-6 col-sm-6 col-md-6 col-lg-6", style:""} # col-xs-6 col-sm-6 col-md-6 col-lg-6 added to html <li> but not work
        pi.input :amount, wrapper_html: {class: "col-xs-6 col-sm-6 col-md-6 col-lg-6"}
    end
   ~~~
1. 补充缺失的参数，参数检查
   ~~~ruby
     controller do
        before_action :set_uid, only: [:create]

        after_create :set_default_password

        private
        def set_default_password(user)
        user.password = 'xxxxxxxxx'
        user.save
        end

        def set_uid

        params[:user][:uid] = params[:user][:mobile] || ""
        Rails.logger.debug params
        end
    end
   ~~~