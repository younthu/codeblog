# config/initializers的调用
railties/lib/rails/engine.rb下面有个注册很多`initializers`, 其中一个是
~~~ruby
initializer :load_config_initializers do
    config.paths["config/initializers"].existent.sort.each do |initializer|
        load_config_initializer(initializer)
    end
end
~~~

这个initializer会加载`config/initializers`目录下所有的内容.

# Gem::LoadError : "ed25519 is not part of the bundle. Add it to your Gemfile."
解决办法: 在命令行下运行 `ssh-add`

# bundle exec的原理
bundle install的时候可以指定路径`bundle install --path /var/www/yoga/yoga-lady/shared/bundle --without development test --deployment --quiet`,
所有环境都装到指定目录下。

`bundle exec`的意义是寻找当前目录下的`.bundle/config`文件，加载正确的bundle环境. 

所以, `rails c`不工作的时候可能是因为gems没有装默认目录下，而是装到指定目录了，可以试试`bundle exec rails c`.
