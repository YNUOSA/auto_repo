#!/usr/bin/env bash
cd /home/strrl/auto_repo/repo_gears/centos
bash clean.sh &
cd /home/strrl/auto_repo/repo_gears/deepin
bash clean.sh &
cd /home/strrl/auto_repo/repo_gears/deepin-cd
bash clean.sh &
cd /home/strrl/auto_repo/repo_gears/kali
bash clean.sh &
cd /home/strrl/auto_repo/repo_gears/kali-images
bash clean.sh &
cd /home/strrl/auto_repo/repo_gears/ubuntu
bash clean.sh &
cd /home/strrl/auto_repo/repo_gears/ubuntu-cdimage
bash clean.sh &
