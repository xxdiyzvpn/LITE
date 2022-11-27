#!/bin/bash
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
#########################

clear
echo -e "${RED}Installing Some Updates On This VPS${NC}"
mkdir -p /etc/diyvpn
mkdir -p /etc/diyvpn/xray
mkdir -p /etc/diyvpn/ntls
mkdir -p /etc/diyvpn/tls
mkdir -p /etc/diyvpn/config-url
mkdir -p /etc/diyvpn/config-user
mkdir -p /etc/diyvpn/xray/conf
mkdir -p /etc/diyvpn/ntls/conf
mkdir -p /etc/systemd/system/
mkdir -p /var/log/xray/
touch /etc/diyvpn/xray/user.txt

apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# Install Requirements Tools
apt install ruby -y
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y
apt-get install netfilter-persistent -y
apt-get install socat -y
apt install figlet -y
apt install git -y
clear
echo "Please Input Your Domain Name"
read -p "Input Your Domain : " host
if [ -z $host ]; then
    echo "No Domain Inserted !"
else
    echo $host >/root/domain
fi
echo -e "${RED}Installing XRAY${NC}"
sleep 2

wget https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/xray-menu.sh" && chmod +x menu
wget -O xp "https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/xp.sh" && chmod +x xp
wget -O installer "https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/installer.sh" && chmod +x installer
wget -O bbt "https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/bbt.sh" && chmod +x bbt
wget -O tcp "https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/tcp.sh" && chmod +x tcp
timedatectl set-timezone Asia/Kuala_Lumpur
echo "0 */2 * * * root pkill -e bash" >>/etc/crontab
echo "0 0 * * * root xp" >>/etc/crontab
echo "1 0 * * * root systemctl restart xray.service" >>/etc/crontab
echo "1 0 * * * root systemctl restart xray@n" >>/etc/crontab
echo "1 0 * * * root systemctl restart xray.service" >>/etc/crontab
echo "0 5 * * * root reboot" >>/etc/crontab
/etc/init.d/cron restart
clear
systemctl restart nginx
cd
echo "menu" >>/root/.profile
echo " "
echo -e "═══════════════[Autoscript DIYNETWORKK]═══════════════" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    >>> Service Details <<<"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ XRAY INFORMATION ]" | tee -a log-install.txt
echo -e "   ════════════════════" | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442" | tee -a log-install.txt
echo "   - Stunnel4                : 789, 777" | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080" | tee -a log-install.txt
echo "   - VLess TCP XTLS          : 443" | tee -a log-install.txt
echo "   - XRAY  Trojan TLS        : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ SERVER INFORMATION ]"  | tee -a log-install.txt
echo -e "   ════════════════════" | tee -a log-install.txt
echo "   - Timezone                : Asia/Malaysia (GMT+8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPV6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 06.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "════════════════[Autoscript By DIYNETWORKK]════════════════" | tee -a log-install.txt
echo ""
rm -f /root/ins-xray.sh
rm -f /root/setup.sh
read -n 1 -s -r -p "Press any key to reboot"
reboot
