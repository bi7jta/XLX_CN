#!/bin/bash -x
# 第一步，先创建一个配置文件，指向你搭建的服务器IP地址，4004是默认的D模块
# echo "995;192.168.1.206;4004" >> /home/pi-star/XLXHosts995.txt
# 为什么要用995？ 因为我已经往Pi-Star服务器更新文件里面注册了995，具体访问下 bi7jta.org/xlx
# 如何注册自己的xlx反射器到Pi-Star服务更新？ 首先要有公网固定IP，动态域名绑定动态IP貌似也可以，然后去XLX Web配置打开一个参数，写入XLX反射器号码；
# 本人第一次注册时还需要写邮件给管理员添加，但VR2VYE/BH7JTB的动态域名可以省略了申请此步骤，我后来准备改回动态域名，一直没有成功，不要问我为什么。

# 不是必要的，因为我们已经指向了另一个文件，不建议直接用此文件，否则自动更新时会被覆盖
sudo grep "995;192.168.1.206;4004" /usr/local/etc/XLXHosts.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found! add "
    sudo sed -i '$a\995;192.168.1.206;4004' /usr/local/etc/XLXHosts.txt
fi 
# 不是必要的（这是更新缓存,由于Pi-Star的缓存文件名每次重启都会变化，建议ls一下此目录确认一下是否相同）
sudo grep "995;192.168.1.206;4004" /usr/local/etc/XLXHosts.txt.`date +%Y%m%d` > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found! add "
    sudo sed -i '$a\995;192.168.1.206;4004' /usr/local/etc/XLXHosts.txt.`date +%Y%m%d`
fi 
# **必要的**，将XLX配置文件重新指向新创建的/home/pi-star/XLXHosts995.txt ，避免自动更新时覆盖此文件
# ** 建议为你的Pi-Star设置固定IP地址
sudo sed -i "s/\/usr\/local\/etc\/XLXHosts.txt/\/home\/pi-star\/XLXHosts995.txt/g" /etc/dmrgateway

# 不是必要的
sudo grep "XLX_995" /usr/local/etc/DMR_Hosts.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
	echo "Not found! add "
	sudo sed -i '$a\XLX_995				0000	192.168.1.206			passw0rd	62030' /usr/local/etc/DMR_Hosts.txt
fi

# 完成后重启Pi-Star的服务
# sudo /usr/local/sbin/mmdvmhost.service restart;    
# sudo /usr/local/sbin/dmrgateway.service restart;  

# 查看日志
# Server  
# tail -100f /var/log/messages
# Client  
# tail -100f /var/log/pi-star/DMRGateway-2019-11-03.log 
# tail -100f /var/log/pi-star/MMDVM-2019-11-04.log

