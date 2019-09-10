#!/bin/bash -x
# 不是必要的
sudo grep "9999;192.168.1.206;4004" /usr/local/etc/XLXHosts.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found! add "
    sudo sed -i '$a\9999;192.168.1.206;4004' /usr/local/etc/XLXHosts.txt
fi 
# 不是必要的
sudo grep "9999;192.168.1.206;4004" /usr/local/etc/XLXHosts.txt.`date +%Y%m%d` > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found! add "
    sudo sed -i '$a\9999;192.168.1.206;4004' /usr/local/etc/XLXHosts.txt.`date +%Y%m%d`
fi 
# 必要的
sudo sed -i "s/\/usr\/local\/etc\/XLXHosts.txt/\/home\/pi-star\/XLXHosts9999.txt/g" /etc/dmrgateway

# 不是必要的
sudo grep "XLX_9999" /usr/local/etc/DMR_Hosts.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
	echo "Not found! add "
	sudo sed -i '$a\XLX_9999				0000	192.168.1.206			passw0rd	62030' /usr/local/etc/DMR_Hosts.txt
fi

