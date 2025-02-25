# 简介

本项目快速构建开发环境。你也可以修改`Vagrantfile`，定制自己的虚拟开发环境。

# 准备

安装依赖软件：

- `homebrew`
- `vagrantup`
- `vmware desktop`：参考 https://www.vagrantup.com/docs/providers/vmware

从[Vagrant Public Registry](https://portal.cloud.hashicorp.com/vagrant/discover)下载依赖的box：

- `vagrant box add "generic/centos8_virtualbox_4.3.12" {file_path_of_vagrant_box}`

注意：

- vmware是收费软件，如果没有可以使用virtualbox

# 启动环境

```sh
> # start vm
> vagrant up --provider virtualbox
```

# 配置开发环境

```sh
> # 设置时区、关闭防火墙、安装基本工具
> cd /vagrant/scripts && sudo ./init-dev-env.sh
```

# References

- Vagrant: https://www.vagrantup.com/docs/index.html
- Discover Vagrant Boxes
  - https://atlas.hashicorp.com/boxes/search
  - http://www.vagrantbox.es/

