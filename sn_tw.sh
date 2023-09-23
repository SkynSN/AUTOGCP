#!/bin/bash

red='\x1b[31;1m'
yellow='\x1b[33;1m'
green='\x1b[32;1m'
plain='\033[0m'



echo -e "${yellow}Creating instance ...${plain}"
instance=$(gcloud dataproc clusters create snpromax --enable-component-gateway --region asia-east1 --single-node --master-machine-type n2-standard-8 --master-boot-disk-size 500 --image-version 1.5-ubuntu18 --optional-components ANACONDA,JUPYTER)


echo -e "${green}Instance created.${plain}"
echo -e "${yellow}Checking firewall rule ...${plain}"

if [[ $(gcloud compute firewall-rules list --format='value(allowed)') == *"'all'"* ]];
then
echo -e "${green}Firewall rule already exist.${plain}"

else
echo -e "${yellow}Creating firewall rule ...${plain}"

gcloud compute firewall-rules create firewall-sn --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=all --source-ranges=0.0.0.0/0,35.235.240.0/20 --no-user-output-enabled
echo -e "${green}Firewall rule created.${plain}"
fi
echo -e "\n${red}GCP TAIWAN SERVER 🇹🇼 ${plain}\n"
echo "------------------------------------"
printf " Taiwan GCP Instance Done ✍️ \n"
echo "------------------------------------"
echo ""

echo -e "${yellow}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"
echo -e "${red}.    Contact the developer https://t.me/mlulinX for more information                ${plain}"
echo -e "${yellow}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"
