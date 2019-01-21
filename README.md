# 连接方法  
进入 ssh 模式  
http://pi-star:2222  
用户名  pi-star  
密码  raspberry  

执行(复制粘贴以下内容)  
```
rpi-rw;  
curl -OL https://raw.githubusercontent.com/bi7jta/XLX_CN/master/update-XLX995-Local-Setting.sh;   
chmod +x update-XLX995-Local-Setting.sh;  
./update-XLX995-Local-Setting.sh;  

```
![图片装载中](/XLX995_RunScript.png)  

回到配置页面，DMR配置选择【DMR gateway】打开并选择XLX服务器为 995     
http://pi-star/admin/configure.php   
DMR Master: DMRGateway  
BrandMeister Master: BM_China_4601 
DMR+ 保持默认不打开  
XLX Master: 999  
XLX Master Enable: 打开  
其它默认   
![图片装载中](/XLX995_PiStarConfig.png)  

保存，等待连接成功后，呼叫 TG6 ，进入XLX房间（注意此房间并没有连接BM服务器）    
服务端在线列表：  https://www.bi7jta.org/xlx/    
![图片装载中](/XLX-Config3.png)  
QQ讨论群  320533571   
搭建方法： https://sadigitalradio.com/digital-radio-how-tos/create-xlx-xrf-d-star-reflector/  
要求： Debian 或其它Linux环境  
资源：
http://xrefl.net/  
https://wiki.brandmeister.network/index.php/XLX  
http://www.pistar.uk/downloads/XLXHosts.txt  
https://www.bi7jta.org/xlx/index.php?show=reflectors  

# Copyright

� 2016 Luc Engelmann LX1IQ

The XLX Multiprotocol Gateway Reflector Server is part of the software system
for the D-Star Network.
The sources are published under GPL Licenses.

# Usage

The packages which are described in this document are designed to install server
software which is used for the D-Star network infrastructure.
It requires a 24/7 internet connection which can support 20 voice streams or more
to connect repeaters and hotspot dongles!!

- The server requires a fix IP-address !
- The public IP address should have a DNS record which must be published in the
common host files.

If you want to run this software please make sure that you can provide this
service free of charge, like the developer team provides the software and the
network infrastructure free of charge!

# Requirements

The software packages for Linux are tested on Debian7 (Wheezy) 32 and 64bit or newer.
Raspbian will work but is not recommended.
Please use the stable version listed above, we cannot support others.

# Installation

## Debian 7 (Wheezy) 32 and 64bit

###### After a clean installation of debian make sure to run update and upgrade
```
# apt-get update
# apt-get upgrade
```
###### Install Git
```
# apt-get install git git-core
```
###### Install webserver with PHP5 support
```
# apt-get install apache2 php5
```

###### Install g++ compiler
```
 # apt-get install build-essential
 # apt-get install g++-4.7 (skip this step on Debian 8.x) 
```

###### Download and compile the XLX sources
```
# git clone https://github.com/LX3JL/xlxd.git
# cd xlxd/src/
# make clean
# make
# make install
```

###### Copy startup script "xlxd" to /etc/init.d
```
# cp ~/xlxd/scripts/xlxd /etc/init.d/xlxd
```

###### Adapt the default startup parameters to your needs
```
# pico /etc/init.d/xlxd
```
###### Download the dmrid.dat from the XLXAPI server to your xlxd folder
```
# wget -O /xlxd/dmrid.dat http://xlxapi.rlx.lu/api/exportdmr.php
```

###### Check your FTDI driver and install the AMBE service according to the readme in AMBEd
```
 
```

###### Last step is to declare the service for automatic startup and shutdown
```
# update-rc.d xlxd defaults
```

###### Start or stop the service with
```
# service xlxd start
# service xlxd stop
```

###### Copy dashboard to /var/www
```
# cp -r ~/xlxd/dashboard /var/www/db
```

###### Give the dashboard read access to the server log file 
```
# chmod +r /var/log/messages 
```

###### Reboot server to see if the auto-start is working
```
# reboot
```

# Firewall settings #

XLX Server requires the following ports to be open and forwarded properly for in- and outgoing network traffic:
 - TCP port 80            (http) optional TCP port 443 (https)
 - TCP port 8080          (RepNet) optional
 - UDP port 10001         (json interface XLX Core)
 - UDP port 10002         (XLX interlink)
 - TCP port 22            (ssh) optional  TCP port 10022
 - UDP port 30001         (DExtra protocol)
 - UPD port 20001         (DPlus protocol)
 - UDP port 30051         (DCS protocol)
 - UDP port 8880          (DMR+ DMO mode)
 - UDP port 62030         (MMDVM protocol)
 - UDP port 10100         (AMBE controller port)
 - UDP port 10101 - 10199 (AMBE transcoding port)

� 2016 Luc Engelmann LX1IQ
