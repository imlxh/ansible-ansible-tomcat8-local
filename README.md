ansible-tomcat
===============

tomcat8+JDK8自动安装部署ansible-playbook脚本（本地安装包环境在分支local下，默认为本地安装包环境，远程下载包模式请下载分支cloud）。
此安装脚本定义全局变量在group_vars/tomcat文件中，使用时请根据自己的需求修改相关参数值。
```
jdk_archive_file: jdk-8u77-linux-x64.tar.gz   ##JDK压缩包名称
jdk_extract_dir: jdk1.8.0_77               ##JDK版本名称

tomcat_version: 8.5.31                     #tomcat版本名称（用于下载指定文件和重命名）
tomcat_file: apache-tomcat-8.5.31.tar.gz   #tomcat压缩包名称
app_name: demo-tomcat-8080   ##tomcat目录名称
app_directory: /data/app   ##tomcat安装位置

http_port: 8080    ##tomcat http端口
ajp_port: 8009    ##tomcat ajp端口

ipv6_disable: True

jmx_registry_port: 10080  ##jmx接口，默认没有用
jmx_server_port: 10081  ##jmx接口，默认没有用

tomcat_user: admin   #tomcat工作用户名
tomcat_group: admin   #tomcat工作用户组

min_heap_size: 512M
max_heap_size: 512M
metaspace_size: 128M
max_metaspace_size: 128M

gc_log_file: /logs/gc.log
heap_dump_dir: /logs
```
模板中，将环境变量设置放置在setenv.sh中，默认设置了gc日志和堆内存限制，如有特殊需求请修改如下文件。
See: roles/tomcat8/templates/tomcat/bin/setenv.sh



tomcat8安装脚本详见。
See: roles/tomcat8/tasks/main.yml


Building
--------

### ansible安装

```shell
sudo yum install -y epel-release
sudo yum install -y ansible
```

### git clone

```shell
git clone https://github.com/imlxh/ansible.git
```


###ansible cluster配置
```shell
ssh-keygen -t rsa
ssh-copy-id -i .ssh/id_rsa.pub root@192.168.0.100   ##免密钥认证
```
###配置ansible hosts
位置/etc/ansible/hosts
示例：
```
[tomcat]
tomcat1 ansible_ssh_host=192.168.0.100
```
###ansbile playbook配置
位置 site.yml
```
- hosts: tomcat    ##tomcat对应ansible [tomcat]标签
  remote_user: root

  roles:
    - oracle-jdk8
    - tomcat8
```
### ansible-playbook 

```shell
cd ansible; ./ansible-build.sh
或者 ansible-playbook site.yml
```

