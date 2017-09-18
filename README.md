# 简介

本项目快速构建开发环境。你也可以修改`Vagrantfile`，定制自己的虚拟开发环境。

# 准备

安装依赖软件：

- macOS Sierra Version 10.12.5
- `homebrew`
- `vagrantup`
- `virualbox`

下载依赖软件：

- 执行`download-go-install-pkg.sh`下载Golang Linux Package: https://golang.org/dl/

# 如何构建Golang开发环境Vagrant Box

## 构建`postgresql-9.5.3-dev-vm.box`

编写`Vagrantfile`:

见[这里](./src/PostgreSQL-9.5.3/Vagrantfile)

构建`Vagrant Box`:

```sh
> # start vm
> vagrant up

> # create vagrant box
> vagrant package --output "postgresql-9.5.3-dev-vm.box" $(vagrant global-status | grep 'src/PostgreSQL-9.5.3' | awk '{print $1}') && mv postgresql-9.5.3-dev-vm.box ../../box/
```

# References

- Vagrant: https://www.vagrantup.com/docs/index.html
- Discover Vagrant Boxes
  - https://atlas.hashicorp.com/boxes/search
  - http://www.vagrantbox.es/
