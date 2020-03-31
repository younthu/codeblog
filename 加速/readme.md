# brew 代理
brew在国内越来越慢了，更新一次要巨长时间，下载更慢。 可以用中科大的源[知乎]](
https://www.zhihu.com/question/31360766/answer/749386652)。


把下面的指令都执行一遍，以后每次会自动用国内的源了。 前上条指令是修改brew库的git地址, 后两条是修改bottles的源。
~~~shell
# 替换 Homebrew
git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git

# 替换 Homebrew Core
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

# 替换 Homebrew Cask
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

# 替换 Homebrew-bottles
# 对于 bash 用户：
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile
# 对于 zsh 用户：
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
source ~/.zshrc

~~~

