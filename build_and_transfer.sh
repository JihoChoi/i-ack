#!/bin/bash
# Build and Transfer Shell Script

# Jiho Choi

echo ""
echo -e "---------------------------------------------------------"
echo -e "\t Start Ath9k Cross Compilation"
echo -e "---------------------------------------------------------"
echo -e ""
echo -e "\t ath9k - Atheros 802.11n PCI/PCI-E devices driver"
echo -e ""
echo -e "---------------------------------------------------------"

# ~/i-ack/openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01
cd ./openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01

make

# ./openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01/drivers/net/wireless/ath/ath9k/ath9k_hw.ko
# ./openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01/drivers/net/wireless/ath/ath9k/ath9k.ko
# ./openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01/drivers/net/wireless/ath/ath9k/ath9k_common.ko


echo -e "\nDo you want to start the transfer? [y/N]"

read YesNo

if [ $YesNo = "Y" ] || [ $YesNo = "y" ]; then
	echo "YES"
else
	exit
fi

echo ""
echo -e "---------------------------------------------------------"
echo -e "\t Transfer the Kernel Objects"
echo -e "---------------------------------------------------------"
echo -e ""
echo -e "\t ath9k.ko"
echo -e "\t ath9k_common.ko"
echo -e "\t ath9k_hw.ko"
echo -e "\t insert_and_remove_mod.sh"
echo -e ""
echo -e "---------------------------------------------------------"

exit

# cd ~/iack/openwrt/build_dir/target-mips_24kc_musl/linux-ar71xx_generic/backports-2017-11-01

echo -e "\tFeed the root password"

DEST="root@192.168.1.1:/tmp"

scp -r ./drivers/net/wireless/ath/ath9k/ath9k.ko $DEST
scp -r ./drivers/net/wireless/ath/ath9k/ath9k_common.ko $DEST
scp -r ./drivers/net/wireless/ath/ath9k/ath9k_hw.ko $DEST
scp -r ./drivers/net/wireless/ath/ath9k/insert_and_remove_mod.sh $DEST
