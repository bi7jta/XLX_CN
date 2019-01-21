#!/bin/bash -x

sudo grep "995;www.bi7jta.org;4004" /usr/local/etc/XLXHosts.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found! add "
    sudo sed -i '$a\995;www.bi7jta.org;4004' /usr/local/etc/XLXHosts.txt
fi 

sudo grep "995;www.bi7jta.org;4004" /usr/local/etc/XLXHosts.txt.`date +%Y%m%d` > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found! add "
    sudo sed -i '$a\995;www.bi7jta.org;4004' /usr/local/etc/XLXHosts.txt.`date +%Y%m%d`
fi 

sudo sed -i "s/\/home\/pi-star\/XLXHostsCN.txt/\/usr\/local\/etc\/XLXHosts.txt/g" /etc/dmrgateway

sudo grep "XLX_995" /usr/local/etc/DMR_Hosts.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
	echo "Not found! add "
	sudo sed -i '$a\XLX_995				0000	www.bi7jta.org			passw0rd	62030' /usr/local/etc/DMR_Hosts.txt
fi

sudo grep "XLX_995" /usr/local/etc/DMR_Hosts.txt.`date +%Y%m%d` > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
	echo "Not found! add "
	sudo sed -i '$a\XLX_995				0000	www.bi7jta.org			passw0rd	62030' /usr/local/etc/DMR_Hosts.txt.`date +%Y%m%d`
fi
