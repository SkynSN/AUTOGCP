#!/bin/bash

red='\x1b[31;1m'
yellow='\x1b[33;1m'
green='\x1b[32;1m'
plain='\033[0m'




echo -e "${yellow}Creating instance ...${plain}"
instance=$(gcloud dataproc clusters create cluster-skyn --region australia-southeast1 --zone australia-southeast1-c --master-machine-type n2d-standard-4 --master-boot-disk-size 100 --num-master-local-ssds 1 --num-workers 2 --worker-machine-type n2d-standard-2 --worker-boot-disk-size 100 --image-version 2.1-ubuntu20)
echo -e "${green}Instance created.${plain}"
echo -e "${yellow}Checking firewall rule ...${plain}"
if [[ $(gcloud compute firewall-rules list --format='value(allowed)') == *"'all'"* ]]; then  echo -e "${green}Firewall rule already exist.${plain}"
else  echo -e "${yellow}Creating firewall rule ...${plain}"
gcloud compute firewall-rules create firewall-sn --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=all --source-ranges=0.0.0.0/0,35.235.240.0/20 --no-user-output-enabled
echo -e "${green}Firewall rule created.${plain}"fi
echo -e "\n${red}GCP AUSTRALIA SERVER 🇦🇺 ${plain}\n"

echo "------------------------------------"
printf " Australia GCP Instance Done ✍️
echo "------------------------------------"
echo ""

echo -e "${yellow}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"
echo -e "${red}Contact the developer https://t.me/mlulinX for more information                ${plain}"
echo -e "${yellow}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"