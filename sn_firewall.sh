#!/bin/bash

red='\x1b[31;1m'
yellow='\x1b[33;1m'
green='\x1b[32;1m'
plain='\033[0m'


echo -e "${yellow}Checking firewall rule ...${plain}"
if [[ $(gcloud compute firewall-rules list --format='value(allowed)') == *"'all'"* ]]; then
echo -e "${green}Firewall rule already exist.${plain}"
else
echo -e "${yellow}Creating firewall rule ...${plain}"
gcloud compute firewall-rules create firewall-sn --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=all --source-ranges=0.0.0.0/0, 35.235.240.0/20--no-user-output-enabled
echo -e "${green}Firewall rule created.${plain}"
fi

echo ""
echo "------------------------------------"
printf "  SN Production Inc (@mlulinX)
echo "------------------------------------"
echo ""
echo -e "${yellow}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"