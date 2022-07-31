# jul/24/2022 21:04:01 by RouterOS 6.48.5
# software id = GR0G-Y8DD
#
# model = 951Ui-2HnD
# serial number = 4AC904A663F5
/interface ethernet
set [ find default-name=ether1 ] name=ether1_WAN
set [ find default-name=ether2 ] name=ether2_Hotspot
set [ find default-name=ether3 ] name=ether3_LAN
set [ find default-name=ether4 ] name=ether4_LAN
set [ find default-name=ether5 ] name=ether5_LAN
/interface wireless
set [ find default-name=wlan1 ] disabled=no ssid=MikroTik
/interface vlan
add interface=ether2_Hotspot name=vlan1_PPPoE vlan-id=101
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip firewall layer7-protocol
add name=Facebook regexp="^.+(facebook.com|m.facebook.com).*\$"
add name=Instagram regexp="^.+(instagram.com|cdninstagram.com|.cdninstagram.co\
    m|.instagram.com|instagram.|.instagram|.cdninstagram|cdninstagram.).*\$"
add name=Tiktok regexp="^.+(myqcloud.com|wsdvs.com|worldfcdn.com|footprint.net\
    |byteoversea.|ibyteimg.|.ibyteimg|ibyteimg.com|musemuse.cn|muscdn.com|.byt\
    eoversea|byted.org|bytecdn.cn|byteoversea.com|.musical|musical.|musical.ly\
    |tiktokcdn.com|tiktokv.com|tiktokcdn.com|.tiktokv|tiktokv.|tiktokcdn-com|.\
    akamaized|akamaized.net|akamaized.|tiktok.com|www.tiktok.com|m.tiktok.com|\
    tiktok.|tiktok|.zhiliaoapp|.musically|zhiliaoapp.|musically.).*\$"
add name=Twitter regexp="^.+(twitter.com|twimg.com).*\\\$"
/ip hotspot profile
add dns-name=wifisulaimaniyah.net hotspot-address=10.20.30.1 html-directory=\
    hotspot/hotspot_sulaimaniyah_2022 login-by=\
    http-chap,http-pap,trial,mac-cookie name=Hotspot_Sulaimaniyah \
    trial-uptime-limit=15m
/ip pool
add name=Pool_Hotspot_Sulaimaniyah1 ranges=10.20.30.11-10.20.30.250
add name=dhcp_pool1_LAN3 ranges=192.168.3.2-192.168.3.11
add name=dhcp_pool2_LAN4 ranges=192.168.4.2-192.168.4.11
add name=dhcp_pool3_LAN5 ranges=192.168.5.2-192.168.5.11
add name=dhcp_pool4_WLAN ranges=192.168.6.2-192.168.6.254
add name=Pool_Hotspot_Talebe ranges=10.20.30.51-10.20.30.250
add name=Pool_Hotspot_Abiler ranges=10.20.30.11-10.20.30.50
/ip dhcp-server
add address-pool=Pool_Hotspot_Sulaimaniyah1 disabled=no interface=\
    ether2_Hotspot lease-time=1h name=dhcp_Hotspot
add address-pool=dhcp_pool1_LAN3 disabled=no interface=ether3_LAN lease-time=\
    1h name=dhcp_Ether3
add address-pool=dhcp_pool2_LAN4 disabled=no interface=ether4_LAN lease-time=\
    1h name=dhcp_Ether4
add address-pool=dhcp_pool3_LAN5 disabled=no interface=ether5_LAN lease-time=\
    1h name=dhcp_Ether5
add address-pool=dhcp_pool4_WLAN disabled=no interface=wlan1 lease-time=1h \
    name=dhcp_WLAN
/ip hotspot
add address-pool=Pool_Hotspot_Sulaimaniyah1 disabled=no interface=\
    ether2_Hotspot name=Hotspot_Sulaimaniyah profile=Hotspot_Sulaimaniyah
/queue simple
add name=TOTAL queue=default/default target=\
    ether1_WAN,ether2_Hotspot,ether3_LAN,ether4_LAN,ether5_LAN,wlan1
add name=WAN parent=TOTAL priority=1/1 queue=default/default target=\
    ether1_WAN
add name=DNS_PING packet-marks=PAKET-PING-DNS parent=TOTAL priority=2/2 \
    queue=pcq-upload-default/pcq-download-default target="ether1_WAN,ether2_Ho\
    tspot,ether3_LAN,ether4_LAN,ether5_LAN,vlan1_PPPoE,wlan1"
add name=KONEKSI_ZOOM packet-marks=Paket-Zoom parent=TOTAL priority=2/2 \
    queue=pcq-upload-default/pcq-download-default target="10.20.30.0/24,192.16\
    8.3.0/24,192.168.4.0/24,192.168.5.0/24,192.168.6.0/24,192.168.10.0/24"
add max-limit=5M/5M name=KONEKSI_GAME packet-marks=PAKET-GAME parent=TOTAL \
    priority=5/5 target=10.20.30.0/24,192.168.6.0/24
add name=HOTSPOT parent=TOTAL priority=3/3 target=10.20.30.0/24
add max-limit=50M/50M name=3_PORT_LANS parent=TOTAL priority=5/5 target=\
    192.168.3.0/24,192.168.4.0/24,192.168.5.0/24
add max-limit=16M/16M name=WLAN parent=TOTAL target=192.168.6.0/24
add max-limit=32M/32M name=VLAN_PPPOE parent=3_PORT_LANS target=vlan1_PPPoE
/ip hotspot user profile
set [ find default=yes ] insert-queue-before=3_PORT_LANS parent-queue=HOTSPOT
add address-pool=Pool_Hotspot_Abiler insert-queue-before=3_PORT_LANS \
    mac-cookie-timeout=1d name=Abiler parent-queue=HOTSPOT queue-type=\
    default-small rate-limit=4096K/16384K shared-users=3
add address-pool=Pool_Hotspot_Talebe insert-queue-before=3_PORT_LANS \
    mac-cookie-timeout=1d name=Talebeler parent-queue=HOTSPOT queue-type=\
    hotspot-default rate-limit=4096K/6144K shared-users=3
/interface pppoe-server server
add default-profile=Kantor_Idareci disabled=no interface=ether2_Hotspot \
    service-name=PPPoE_Hotspot
/ip address
add address=10.20.30.1/24 interface=ether2_Hotspot network=10.20.30.0
add address=192.168.3.1/24 interface=ether3_LAN network=192.168.3.0
add address=192.168.4.1/24 interface=ether4_LAN network=192.168.4.0
add address=192.168.5.1/24 interface=ether5_LAN network=192.168.5.0
add address=192.168.6.1/24 interface=wlan1 network=192.168.6.0
add address=192.168.10.1/24 interface=vlan1_PPPoE network=192.168.10.0
/ip dhcp-client
add disabled=no interface=ether1_WAN
/ip dhcp-server network
add address=10.20.30.0/24 dns-server=\
    1.1.1.3,1.0.0.3,1.1.1.1,8.8.8.8,192.168.100.1 gateway=10.20.30.1
add address=192.168.3.0/24 dns-server=\
    1.1.1.3,1.0.0.3,1.1.1.1,8.8.8.8,192.168.100.1 gateway=192.168.3.1
add address=192.168.4.0/24 dns-server=1.1.1.3,1.0.0.3,8.8.8.8 gateway=\
    192.168.4.1
add address=192.168.5.0/24 dns-server=1.1.1.3,1.0.0.3,8.8.8.8 gateway=\
    192.168.5.1
add address=192.168.6.0/24 dns-server=1.1.1.3,1.0.0.3,8.8.8.8 gateway=\
    192.168.6.1
/ip dns
set servers=1.1.1.3,1.0.0.3
/ip firewall address-list
add address=3.7.35.0/25 list=Zoom-List
add address=3.21.137.128/25 list=Zoom-List
add address=3.22.11.0/24 list=Zoom-List
add address=3.23.93.0/24 list=Zoom-List
add address=3.25.41.128/25 list=Zoom-List
add address=3.25.42.0/25 list=Zoom-List
add address=3.25.49.0/24 list=Zoom-List
add address=3.80.20.128/25 list=Zoom-List
add address=3.96.19.0/24 list=Zoom-List
add address=3.101.32.128/25 list=Zoom-List
add address=3.101.52.0/25 list=Zoom-List
add address=3.104.34.128/25 list=Zoom-List
add address=3.120.121.0/25 list=Zoom-List
add address=3.127.194.128/25 list=Zoom-List
add address=3.208.72.0/25 list=Zoom-List
add address=3.211.241.0/25 list=Zoom-List
add address=3.235.69.0/25 list=Zoom-List
add address=3.235.71.128/25 list=Zoom-List
add address=3.235.72.128/25 list=Zoom-List
add address=3.235.73.0/25 list=Zoom-List
add address=3.235.82.0/23 list=Zoom-List
add address=3.235.96.0/23 list=Zoom-List
add address=4.34.125.128/25 list=Zoom-List
add address=4.35.64.128/25 list=Zoom-List
add address=8.5.128.0/24 list=Zoom-List
add address=8.5.128.0/23 list=Zoom-List
add address=13.52.6.128/25 list=Zoom-List
add address=13.52.146.0/25 list=Zoom-List
add address=18.157.88.0/24 list=Zoom-List
add address=18.205.93.128/25 list=Zoom-List
add address=20.203.158.80/28 list=Zoom-List
add address=20.203.190.192/26 list=Zoom-List
add address=50.239.202.0/23 list=Zoom-List
add address=50.239.204.0/24 list=Zoom-List
add address=52.61.100.128/25 list=Zoom-List
add address=52.202.62.192/26 list=Zoom-List
add address=52.215.168.0/25 list=Zoom-List
add address=64.125.62.0/24 list=Zoom-List
add address=64.211.144.0/24 list=Zoom-List
add address=64.224.32.0/19 list=Zoom-List
add address=65.39.152.0/24 list=Zoom-List
add address=69.174.57.0/24 list=Zoom-List
add address=69.174.108.0/22 list=Zoom-List
add address=99.79.20.0/25 list=Zoom-List
add address=101.36.167.0/24 list=Zoom-List
add address=101.36.170.0/23 list=Zoom-List
add address=103.122.166.0/23 list=Zoom-List
add address=111.33.115.0/25 list=Zoom-List
add address=111.33.181.0/25 list=Zoom-List
add address=115.110.154.192/26 list=Zoom-List
add address=115.114.56.192/26 list=Zoom-List
add address=115.114.115.0/26 list=Zoom-List
add address=115.114.131.0/26 list=Zoom-List
add address=120.29.148.0/24 list=Zoom-List
add address=129.151.1.128/27 list=Zoom-List
add address=129.151.1.192/27 list=Zoom-List
add address=129.151.2.0/27 list=Zoom-List
add address=129.151.3.160/27 list=Zoom-List
add address=129.151.7.96/27 list=Zoom-List
add address=129.151.11.64/27 list=Zoom-List
add address=129.151.11.128/27 list=Zoom-List
add address=129.151.12.0/27 list=Zoom-List
add address=129.151.13.64/27 list=Zoom-List
add address=129.151.15.224/27 list=Zoom-List
add address=129.151.16.0/27 list=Zoom-List
add address=129.151.31.224/27 list=Zoom-List
add address=129.151.40.0/25 list=Zoom-List
add address=129.151.40.160/27 list=Zoom-List
add address=129.151.40.192/27 list=Zoom-List
add address=129.151.41.0/25 list=Zoom-List
add address=129.151.41.192/26 list=Zoom-List
add address=129.151.42.0/27 list=Zoom-List
add address=129.151.42.64/27 list=Zoom-List
add address=129.151.42.128/26 list=Zoom-List
add address=129.151.42.224/27 list=Zoom-List
add address=129.151.43.0/27 list=Zoom-List
add address=129.151.43.64/26 list=Zoom-List
add address=129.151.48.0/27 list=Zoom-List
add address=129.151.48.160/27 list=Zoom-List
add address=129.151.49.0/26 list=Zoom-List
add address=129.151.49.96/27 list=Zoom-List
add address=129.151.49.128/27 list=Zoom-List
add address=129.151.49.192/26 list=Zoom-List
add address=129.151.50.0/27 list=Zoom-List
add address=129.151.50.64/27 list=Zoom-List
add address=129.151.52.128/26 list=Zoom-List
add address=129.151.53.32/27 list=Zoom-List
add address=129.151.53.224/27 list=Zoom-List
add address=129.151.55.32/27 list=Zoom-List
add address=129.151.56.32/27 list=Zoom-List
add address=129.151.57.32/27 list=Zoom-List
add address=129.151.60.192/27 list=Zoom-List
add address=129.159.2.32/27 list=Zoom-List
add address=129.159.2.192/27 list=Zoom-List
add address=129.159.3.0/24 list=Zoom-List
add address=129.159.4.0/23 list=Zoom-List
add address=129.159.6.0/27 list=Zoom-List
add address=129.159.6.96/27 list=Zoom-List
add address=129.159.6.128/26 list=Zoom-List
add address=129.159.6.192/27 list=Zoom-List
add address=129.159.160.0/26 list=Zoom-List
add address=129.159.160.64/27 list=Zoom-List
add address=129.159.163.0/26 list=Zoom-List
add address=129.159.163.160/27 list=Zoom-List
add address=129.159.208.0/21 list=Zoom-List
add address=129.159.216.0/26 list=Zoom-List
add address=129.159.216.64/27 list=Zoom-List
add address=129.159.216.128/26 list=Zoom-List
add address=130.61.164.0/22 list=Zoom-List
add address=132.226.176.0/25 list=Zoom-List
add address=132.226.176.128/26 list=Zoom-List
add address=132.226.177.96/27 list=Zoom-List
add address=132.226.177.128/25 list=Zoom-List
add address=132.226.178.0/27 list=Zoom-List
add address=132.226.178.128/27 list=Zoom-List
add address=132.226.178.224/27 list=Zoom-List
add address=132.226.179.0/27 list=Zoom-List
add address=132.226.179.64/27 list=Zoom-List
add address=132.226.180.128/27 list=Zoom-List
add address=132.226.183.160/27 list=Zoom-List
add address=132.226.185.192/27 list=Zoom-List
add address=134.224.0.0/16 list=Zoom-List
add address=140.238.128.0/24 list=Zoom-List
add address=140.238.232.0/22 list=Zoom-List
add address=144.195.0.0/16 list=Zoom-List
add address=147.124.96.0/19 list=Zoom-List
add address=149.137.0.0/17 list=Zoom-List
add address=150.230.224.0/25 list=Zoom-List
add address=150.230.224.128/26 list=Zoom-List
add address=150.230.224.224/27 list=Zoom-List
add address=152.67.20.0/24 list=Zoom-List
add address=152.67.118.0/24 list=Zoom-List
add address=152.67.168.0/22 list=Zoom-List
add address=152.67.180.0/24 list=Zoom-List
add address=152.67.184.32/27 list=Zoom-List
add address=152.67.240.0/21 list=Zoom-List
add address=152.70.0.0/25 list=Zoom-List
add address=152.70.0.128/26 list=Zoom-List
add address=152.70.0.224/27 list=Zoom-List
add address=152.70.1.0/25 list=Zoom-List
add address=152.70.1.128/26 list=Zoom-List
add address=152.70.1.192/27 list=Zoom-List
add address=152.70.2.0/26 list=Zoom-List
add address=152.70.7.192/27 list=Zoom-List
add address=152.70.10.32/27 list=Zoom-List
add address=152.70.224.32/27 list=Zoom-List
add address=152.70.224.64/26 list=Zoom-List
add address=152.70.224.160/27 list=Zoom-List
add address=152.70.224.192/27 list=Zoom-List
add address=152.70.225.0/25 list=Zoom-List
add address=152.70.225.160/27 list=Zoom-List
add address=152.70.225.192/27 list=Zoom-List
add address=152.70.226.0/27 list=Zoom-List
add address=152.70.227.96/27 list=Zoom-List
add address=152.70.227.192/27 list=Zoom-List
add address=152.70.228.0/27 list=Zoom-List
add address=152.70.228.64/27 list=Zoom-List
add address=152.70.228.128/27 list=Zoom-List
add address=156.45.0.0/17 list=Zoom-List
add address=158.101.64.0/24 list=Zoom-List
add address=158.101.184.0/23 list=Zoom-List
add address=158.101.186.0/25 list=Zoom-List
add address=158.101.186.128/27 list=Zoom-List
add address=158.101.186.192/26 list=Zoom-List
add address=158.101.187.0/25 list=Zoom-List
add address=158.101.187.160/27 list=Zoom-List
add address=158.101.187.192/26 list=Zoom-List
add address=160.1.56.128/25 list=Zoom-List
add address=161.199.136.0/22 list=Zoom-List
add address=162.12.232.0/22 list=Zoom-List
add address=162.255.36.0/22 list=Zoom-List
add address=165.254.88.0/23 list=Zoom-List
add address=166.108.64.0/18 list=Zoom-List
add address=168.138.16.0/22 list=Zoom-List
add address=168.138.48.0/24 list=Zoom-List
add address=168.138.56.0/21 list=Zoom-List
add address=168.138.72.0/24 list=Zoom-List
add address=168.138.74.0/25 list=Zoom-List
add address=168.138.80.0/25 list=Zoom-List
add address=168.138.80.128/26 list=Zoom-List
add address=168.138.80.224/27 list=Zoom-List
add address=168.138.81.0/24 list=Zoom-List
add address=168.138.82.0/23 list=Zoom-List
add address=168.138.84.0/25 list=Zoom-List
add address=168.138.84.128/27 list=Zoom-List
add address=168.138.84.192/26 list=Zoom-List
add address=168.138.85.0/24 list=Zoom-List
add address=168.138.86.0/23 list=Zoom-List
add address=168.138.96.0/22 list=Zoom-List
add address=168.138.116.0/27 list=Zoom-List
add address=168.138.116.64/27 list=Zoom-List
add address=168.138.116.128/27 list=Zoom-List
add address=168.138.116.224/27 list=Zoom-List
add address=168.138.117.0/27 list=Zoom-List
add address=168.138.117.96/27 list=Zoom-List
add address=168.138.117.128/27 list=Zoom-List
add address=168.138.118.0/27 list=Zoom-List
add address=168.138.118.160/27 list=Zoom-List
add address=168.138.118.224/27 list=Zoom-List
add address=168.138.119.0/27 list=Zoom-List
add address=168.138.119.128/27 list=Zoom-List
add address=168.138.244.0/24 list=Zoom-List
add address=170.114.0.0/16 list=Zoom-List
add address=173.231.80.0/20 list=Zoom-List
add address=173.231.92.0/24 list=Zoom-List
add address=173.231.94.0/24 list=Zoom-List
add address=192.204.12.0/22 list=Zoom-List
add address=193.122.16.0/25 list=Zoom-List
add address=193.122.16.192/27 list=Zoom-List
add address=193.122.17.0/26 list=Zoom-List
add address=193.122.17.64/27 list=Zoom-List
add address=193.122.17.224/27 list=Zoom-List
add address=193.122.18.32/27 list=Zoom-List
add address=193.122.18.64/26 list=Zoom-List
add address=193.122.18.160/27 list=Zoom-List
add address=193.122.18.192/27 list=Zoom-List
add address=193.122.19.0/27 list=Zoom-List
add address=193.122.19.160/27 list=Zoom-List
add address=193.122.19.192/27 list=Zoom-List
add address=193.122.20.224/27 list=Zoom-List
add address=193.122.21.96/27 list=Zoom-List
add address=193.122.32.0/21 list=Zoom-List
add address=193.122.40.0/22 list=Zoom-List
add address=193.122.44.0/24 list=Zoom-List
add address=193.122.45.32/27 list=Zoom-List
add address=193.122.45.64/26 list=Zoom-List
add address=193.122.45.128/25 list=Zoom-List
add address=193.122.46.0/23 list=Zoom-List
add address=193.122.208.96/27 list=Zoom-List
add address=193.122.216.32/27 list=Zoom-List
add address=193.122.222.0/27 list=Zoom-List
add address=193.122.223.128/27 list=Zoom-List
add address=193.122.226.160/27 list=Zoom-List
add address=193.122.231.192/27 list=Zoom-List
add address=193.122.232.160/27 list=Zoom-List
add address=193.122.237.64/27 list=Zoom-List
add address=193.122.244.160/27 list=Zoom-List
add address=193.122.244.224/27 list=Zoom-List
add address=193.122.245.0/27 list=Zoom-List
add address=193.122.247.96/27 list=Zoom-List
add address=193.122.252.192/27 list=Zoom-List
add address=193.123.0.0/19 list=Zoom-List
add address=193.123.40.0/21 list=Zoom-List
add address=193.123.128.0/19 list=Zoom-List
add address=193.123.168.0/21 list=Zoom-List
add address=193.123.192.224/27 list=Zoom-List
add address=193.123.193.0/27 list=Zoom-List
add address=193.123.193.96/27 list=Zoom-List
add address=193.123.194.96/27 list=Zoom-List
add address=193.123.194.128/27 list=Zoom-List
add address=193.123.194.224/27 list=Zoom-List
add address=193.123.195.0/27 list=Zoom-List
add address=193.123.196.0/27 list=Zoom-List
add address=193.123.196.192/27 list=Zoom-List
add address=193.123.197.0/27 list=Zoom-List
add address=193.123.197.64/27 list=Zoom-List
add address=193.123.198.64/27 list=Zoom-List
add address=193.123.198.160/27 list=Zoom-List
add address=193.123.199.64/27 list=Zoom-List
add address=193.123.200.128/27 list=Zoom-List
add address=193.123.201.32/27 list=Zoom-List
add address=193.123.201.224/27 list=Zoom-List
add address=193.123.202.64/27 list=Zoom-List
add address=193.123.202.128/26 list=Zoom-List
add address=193.123.203.0/27 list=Zoom-List
add address=193.123.203.160/27 list=Zoom-List
add address=193.123.203.192/27 list=Zoom-List
add address=193.123.204.0/27 list=Zoom-List
add address=193.123.204.64/27 list=Zoom-List
add address=193.123.205.64/26 list=Zoom-List
add address=193.123.205.128/27 list=Zoom-List
add address=193.123.206.32/27 list=Zoom-List
add address=193.123.206.128/27 list=Zoom-List
add address=193.123.207.32/27 list=Zoom-List
add address=193.123.208.160/27 list=Zoom-List
add address=193.123.209.0/27 list=Zoom-List
add address=193.123.209.96/27 list=Zoom-List
add address=193.123.210.64/27 list=Zoom-List
add address=193.123.211.224/27 list=Zoom-List
add address=193.123.212.128/27 list=Zoom-List
add address=193.123.215.192/26 list=Zoom-List
add address=193.123.216.64/27 list=Zoom-List
add address=193.123.216.128/27 list=Zoom-List
add address=193.123.217.160/27 list=Zoom-List
add address=193.123.219.64/27 list=Zoom-List
add address=193.123.220.224/27 list=Zoom-List
add address=193.123.222.64/27 list=Zoom-List
add address=193.123.222.224/27 list=Zoom-List
add address=198.251.128.0/17 list=Zoom-List
add address=202.177.207.128/27 list=Zoom-List
add address=204.80.104.0/21 list=Zoom-List
add address=204.141.28.0/22 list=Zoom-List
add address=206.247.0.0/16 list=Zoom-List
add address=207.226.132.0/24 list=Zoom-List
add address=209.9.211.0/24 list=Zoom-List
add address=209.9.215.0/24 list=Zoom-List
add address=213.19.144.0/24 list=Zoom-List
add address=213.19.153.0/24 list=Zoom-List
add address=213.244.140.0/24 list=Zoom-List
add address=221.122.63.0/24 list=Zoom-List
add address=221.122.64.0/24 list=Zoom-List
add address=221.122.88.64/27 list=Zoom-List
add address=221.122.88.128/25 list=Zoom-List
add address=221.122.89.128/25 list=Zoom-List
add address=221.123.139.192/27 list=Zoom-List
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=drop chain=forward comment=BLOCK-SOSIAL-MEDIA disabled=yes \
    layer7-protocol=Facebook
add action=drop chain=forward disabled=yes layer7-protocol=Instagram
add action=drop chain=forward disabled=yes layer7-protocol=Tiktok
add action=drop chain=forward disabled=yes layer7-protocol=Twitter
/ip firewall mangle
add action=mark-connection chain=prerouting comment=DNS-PING \
    new-connection-mark=DNS-ICMP protocol=icmp
add action=mark-connection chain=prerouting dst-port=53,5353,853,8245 \
    new-connection-mark=DNS-ICMP protocol=tcp
add action=mark-connection chain=prerouting dst-port=53,5353,853,8245 \
    new-connection-mark=DNS-ICMP protocol=udp
add action=mark-packet chain=forward connection-mark=DNS-ICMP \
    new-packet-mark=PAKET-PING-DNS passthrough=no
add action=add-dst-to-address-list address-list=Zoom-List \
    address-list-timeout=6h chain=prerouting comment=KONEKSI-ZOOM \
    dst-address-list=!Zoom-List dst-port=3478,3479,5090,5091,8801-8810 \
    protocol=tcp
add action=add-dst-to-address-list address-list=Zoom-List \
    address-list-timeout=6h chain=prerouting dst-address-list=!Zoom-List \
    dst-port=3478,3479,5090,5091,8801-8810 protocol=udp
add action=mark-connection chain=prerouting dst-address-list=Zoom-List \
    dst-port=80,443 new-connection-mark=Koneksi-Zoom passthrough=yes \
    protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    3478,3479,5090,5091,8801-8810 new-connection-mark=Koneksi-Zoom \
    passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    3478,3479,5090,5091,8801-8810 new-connection-mark=Koneksi-Zoom \
    passthrough=yes protocol=udp
add action=mark-packet chain=forward connection-mark=Koneksi-Zoom \
    new-packet-mark=Paket-Zoom passthrough=no
add action=mark-connection chain=prerouting comment=KONEKSI-MOBILE_LEGEND \
    dst-port=5000-5221,5224-5227,5229-5241,5243-5287,5289-5509,5517,5520-5529 \
    new-connection-mark=KONEKSI-GAME protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    5551-5559,5601-5700,8443,9000-9010,9443,10003,30000-30300 \
    new-connection-mark=KONEKSI-GAME protocol=tcp
add action=mark-connection chain=prerouting dst-port="2702,3702,4001-4009,5000\
    -5221,5224-5241,5243-5287,5289-5509,5517,5520-5529" new-connection-mark=\
    KONEKSI-GAME protocol=udp
add action=mark-connection chain=prerouting dst-port=\
    5551-5559,5601-5700,8001,8130,8443,9000-9010,9120,9992,10003,30000-30300 \
    new-connection-mark=KONEKSI-GAME protocol=udp
add action=mark-connection chain=prerouting comment=KONEKSI-CLASH_ROYALE_COC \
    dst-port=9330-9340 new-connection-mark=KONEKSI-GAME protocol=tcp
add action=mark-connection chain=prerouting dst-port=9330-9340 \
    new-connection-mark=KONEKSI-CLASH_ROYALE_COC protocol=udp
add action=mark-packet chain=forward comment=PAKET-GAME connection-mark=\
    KONEKSI-GAME new-packet-mark=PAKET-GAME passthrough=no
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1_WAN
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.20.30.0/24
/ip hotspot user
add name=sulaimaniyah password=sulaimaniyah
add name=Abi1 password=Abi1 profile=Abiler
add name=Abi2 password=Abi2 profile=Abiler
add limit-bytes-out=2000000000 name=abijabbar password=abijabbar profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe01 password=dyq965 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe02 password=rrd559 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe03 password=mwi192 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe04 password=ifu647 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe05 password=rcm388 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe06 password=yyo319 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe07 password=mmg599 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe08 password=rgk736 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe09 password=qew908 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe10 password=ygy603 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe11 password=lra534 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe12 password=tte278 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe13 password=ijb109 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe14 password=rud410 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe15 password=erz898 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe16 password=xvw838 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe17 password=mhj893 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe18 password=rxg830 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe19 password=fvy343 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe20 password=wsw512 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe21 password=mem699 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe22 password=qes666 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe23 password=gwl497 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe24 password=lnx145 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe25 password=cbf304 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe26 password=adm583 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe27 password=qau712 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe28 password=wxy722 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe29 password=rko383 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe30 password=tzm779 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe31 password=gkg440 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe32 password=fry208 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe33 password=vuw415 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe34 password=you546 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe35 password=hlz454 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe36 password=ike202 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe37 password=ixh217 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe38 password=zke574 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe39 password=dqq247 profile=\
    Talebeler
add limit-bytes-out=2000000000 name=talebe40 password=qcz688 profile=\
    Talebeler
add name=Abi3 password=Abi3 profile=Abiler
add name=Abi4 password=Abi4 profile=Abiler
add name=Abi5 password=Abi5 profile=Abiler
add name=Abi6 password=Abi6 profile=Abiler
add name=Abi7 password=Abi7 profile=Abiler
add name=Abi8 password=Abi8 profile=Abiler
add name=Abi9 password=Abi9 profile=Abiler
add name=Abi10 password=Abi10 profile=Abiler
add name=talebe41 password=talebe41 profile=Talebeler
add name=talebe42 password=talebe42 profile=Talebeler
add name=talebe43 password=talebe43 profile=Talebeler
add name=talebe44 password=talebe44 profile=Talebeler
add name=talebe45 password=talebe45 profile=Talebeler
add name=talebe46 password=talebe46 profile=Talebeler
add name=talebe47 password=talebe47 profile=Talebeler
add name=talebe48 password=talebe48 profile=Talebeler
add name=talebe49 password=talebe49 profile=Talebeler
add name=talebe50 password=talebe50 profile=Talebeler
/ppp profile
add insert-queue-before=bottom name=Kantor_Idareci parent-queue=VLAN_PPPOE \
    queue-type=default-small rate-limit=32M/32M
add insert-queue-before=bottom name=Abiler_maks_2MB parent-queue=VLAN_PPPOE \
    queue-type=default-small rate-limit=16M/16M
/ppp secret
add local-address=192.168.10.1 name=Abi1 password=Abi1 profile=\
    Abiler_maks_2MB remote-address=192.168.10.101 service=pppoe
add local-address=192.168.10.1 name=Abi2 password=Abi2 profile=\
    Abiler_maks_2MB remote-address=192.168.10.102 service=pppoe
add local-address=192.168.10.1 name=Abi3 password=Abi3 profile=\
    Abiler_maks_2MB remote-address=192.168.10.103 service=pppoe
add local-address=192.168.10.1 name=Abi4 password=Abi4 profile=\
    Abiler_maks_2MB remote-address=192.168.10.104 service=pppoe
add local-address=192.168.10.1 name=Test_PPoE password=Test_PPoE profile=\
    Abiler_maks_2MB remote-address=192.168.10.105 service=pppoe
add local-address=192.168.10.1 name=Router_Depan password=Router_Depan \
    profile=Kantor_Idareci remote-address=192.168.10.106 service=pppoe
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=SULAIMANIYAH
/system ntp client
set enabled=yes primary-ntp=216.40.34.37 secondary-ntp=36.86.63.182
/system routerboard settings
set auto-upgrade=yes
/system scheduler
add interval=1d name=enable_talebe_jam_530 on-event=Enable_Talebeler policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/17/2022 start-time=05:00:00
add interval=1d name=disable_talebeler_jam23 on-event=Disable_Talebeler \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/17/2022 start-time=23:00:00
/system script
add dont-require-permissions=no name=Enable_Talebeler owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    foreach u in=[/ip hotspot user find] do={:if ([/ip hotspot user get \$u pr\
    ofile]=\"Talebeler\") do={:log warning \"Talebeler : \$[/ip hotspot user g\
    et \$u name] enable\"\r\
    \n/ip hotspot user enable \$u}}}"
add dont-require-permissions=yes name=Disable_Talebeler owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local profil \"Talebeler\";:local kata \"spesial\";:local daftar [/ip hots\
    pot user find profile=\$profil];:foreach usr in=\$daftar do={:local nama [\
    /ip hotspot user get \"\$usr\" name];:put \$nama;/ip hotspot user disable \
    \$nama;/ip hotspot active remove [find where user=\$nama];/ip hotspot user\
    \_reset-counters \$nama;/ip hotspot user set \$nama limit-bytes-out=2G}"
