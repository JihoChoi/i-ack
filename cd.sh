#!/bin/bash



echo -e "========"
echo -e "Let's Go"
echo -e "--------------------------------------------------"
echo -e "source ./cd.sh or . ./cd.sh # to source the script"
echo -e "--------------------------------------------------\n"


echo "Where do you want to go?"
echo -e "\t 1. tx.c"
echo -e "\t 2. xmit.c"
read WHERE


if [ $WHERE = "1" ]; then
    cd ~/i-ack/openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01/net/mac80211
elif [ $WHERE = "2" ]; then
    cd ~/i-ack/openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01/drivers/net/wireless/ath/ath9k
else
    echo "Where?"
fi







