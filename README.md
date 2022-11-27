## Update & Upgrade First Your VPS for Debian 10

  ```html
  apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot

  ```

## Update & Upgrade First Your VPS for Ubuntu 18.04 & 20.04

  ```html
  apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && sleep 2 && reboot

  ```
 

## Install Full Script

  ```html
  apt update && apt upgrade -y && apt install -y wget screen && wget -q https://raw.githubusercontent.com/xxdiyzvpn/LITE//main/setup.sh && chmod +x setup.sh && screen -S setup ./setup.sh
  
  ```


