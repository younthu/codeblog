# 样例thor, http://xiajian.github.io/rails/ruby/2014/11/11/%E5%AD%A6%E4%B9%A0thor
# http://whatisthor.com/
# https://github.com/erikhuda/thor/wiki, 最全的文档

# [ruby-activerecord-without-rails-tutorial](https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial)
require 'thor'

class MyCLI < Thor
 include Thor::Actions

  desc "hello NAME", "say hello to NAME"
  long_desc <<-LONGDESC
    `cli hello` will print out a message to a person of your
    choosing.

    You can optionally specify a second parameter, which will print
    out a from message as well.

    > $ cli hello "Yehuda Katz" "Carl Lerche"

    > from: Carl Lerche
  LONGDESC
  def hello(name)
    puts "Hello #{name}"
   directory "source", "dst"
  end

  #  def self.source_root
  #    File.dirname(__FILE__)
  #  end
end

WebCli.source_root( File.expand_path("..", Dir.pwd)) # workding dir

MyCLI.start(ARGV)