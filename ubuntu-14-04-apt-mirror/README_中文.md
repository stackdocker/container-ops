Ubuntu分发仓库的Docker镜像
=================================================

摘要
----

这是关于[Ubuntu安装Docker](https://docs.docker.com/engine/installation/linux/ubuntu/)和关于[Ubuntu安装Kubernetes](https://kubernetes.io/docs/getting-started-guides/kubeadm/)离线仓库的DevOps：

* 使用[apt-mirror](http://apt-mirror.github.io/)

* 使用[阿里云镜像站](http://mirrors.aliyun.com/)

* 镜像https://apt.dockerproject.org/

* 镜像https://apt.kubernetes.io/

预备
----

安装虚拟化工具

* 建议安装[VirtualBox](https://www.virtualbox.org/wiki/Downloads)

* 也可挑战开源的Linux KVM, 如有: https://help.ubuntu.com/community/KVM/Installation , 并如图形化的virt-manager，virt-viewer等

* 另可选择免费的VMware Player

* 建议使用DevOps工具[Vagrant](https://www.vagrantup.com/downloads.html)

安装Linux

* 使用ISO，如[Ubuntu Aliyun](http://mirrors.aliyun.com/ubuntu-releases/), [Fedora Aliyun](http://mirrors.aliyun.com/fedora/releases/)等
* 或使用[Vagrant provisioner](https://www.vagrantup.com/docs/getting-started/)和Hashicorp的[Atlas VBox镜像库](https://atlas.hashicorp.com/boxes/search)

安装Docker

* 参考[docker docs](https://docs.docker.com/engine/installation/linux/ubuntu/)

下载基础镜像

* 如[Ubuntu](https://github.com/docker-library/docs/tree/master/ubuntu), [Fedora](https://github.com/docker-library/docs/tree/master/fedora), [CentOS](https://github.com/docker-library/docs/tree/master/centos), [Debian](https://github.com/docker-library/docs/tree/master/debian), [Alpine](https://github.com/docker-library/docs/tree/master/alpine), [OpenSUSE](https://github.com/docker-library/docs/tree/master/opensuse)等等

* 参考[docker postinstall docs](https://docs.docker.com/engine/installation/linux/linux-postinstall/#/specify-dns-servers-for-docker)的第4步

正文
----

### 概念验证


### 脚本自动化


### 镜像的镜像
