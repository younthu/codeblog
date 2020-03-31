# Go环境搭建

1. `brew install go` 或者 `brew install golang`
2. 设置GOPATH, GOPATH是用来安装go相关的包的。 下面的脚本用来设置GOPATH, 跑一次就可以了。
    ~~~shell
    echo 'export GOPATH=~/.go' >> ~/.zshrc
    echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
    source ~/.zshrc
    ~~~
3. 

# Gin安装

包管理, govendor或者go mod
1. go get -u github.com/gin-gonic/gin
2. 