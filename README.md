# 简介

本项目快速构建开发环境。你也可以修改`Vagrantfile`，定制自己的虚拟开发环境。

# 准备

安装依赖软件：

- `homebrew`
- `vagrantup`
- `vmware desktop`：参考 https://www.vagrantup.com/docs/providers/vmware

下载依赖的box：

- `vagrant box add "CentOS/7" https://app.vagrantup.com/centos/boxes/7/versions/2004.01/providers/vmware_desktop.box`

注意：

- vmware是收费软件，如果没有可以使用virtualbox

# 启动环境

```sh
> # start vm
> vagrant up --provider vmware_desktop
```

# 配置开发环境

```sh
> # 升级git
> cd /vagrant/scripts && sudo ./upgrade-git.sh
```

# References

- Vagrant: https://www.vagrantup.com/docs/index.html
- Discover Vagrant Boxes
  - https://atlas.hashicorp.com/boxes/search
  - http://www.vagrantbox.es/

