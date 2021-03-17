#!/bin/bash
# ESSID tool. Author on t.me/U5M4NA6A

wifi=0
ethernet=0
tethering=0
nc=0

if [ $(/usr/sbin/ip link  | grep ": w.*:" | awk -F ": " '{print $2}') ]
	then
		if [ "$(LANG=en nmcli | grep "^w.....:" | awk '{print $2}' )" == "disconnected" ];
			then
				wifi=0
			else
				wifi=1
		fi
fi
	
if [ "$(ip link  | grep ": e...:" | awk -F ": " '{print $2}')" ]
	then
		if [ "$(LANG=en nmcli | grep "^e...:" | awk '{print $2}')" == "unavailable" ];
			then
				ethernet=0
			else
				ethernet=1
		fi
fi

if [ "$(ip link  | grep ": e.....:" | awk -F ": " '{print $2}')" ]
	then
		if [ "$(LANG=en_US.UTF-8 nmcli | grep "^e.....:" | awk '{print $2}')" == "unavailable" ];
			then
				ethernet=0
			else
				ethernet=1
		fi
fi


if [ "$(ip link  | grep ": e..........:" | awk -F ": " '{print $2}')" ]
	then
		if [ "$(LANG=en nmcli | grep "^e..........:" | awk '{print $2}')" == "unavailable" ];
			then
				tethering=0
			else
				tethering=1
		fi
fi

if [ $(($wifi+$ethernet)) == "2" ]
	then
		echo " +  [ $(LANG=en_US.UTF-8 nmcli | grep ^wl...\*: | sed "s/wl.*: connected to //g") + Wired ] "
	else
		nc=$(($nc+1))
fi

if [ $(($wifi+$tethering)) == "2" ]
	then
		echo " +  [ "$(LANG=en_US.UTF-8 nmcli | grep ^wl.\*: | sed "s/wl.*: connected to //g")" + USB Teth.] "
	else
		nc=$(($nc+1))
fi

if [ $(($ethernet+$tethering)) == "2" ]
	then
		echo " +  [ Usb+Wired ] "
	else
		nc=$(($nc+1))
fi

if [ $ethernet == "1" ]
	then
		echo "  [ Wired ] "
	else
		nc=$(($nc+1))
fi

if [ $tethering == "1" ]
	then
		echo "  [ Usb Teth. ] "
	else
		nc=$(($nc+1))
fi

if [ $wifi == "1" ]
	then
		echo "  [ "$(LANG=en_US.UTF-8 nmcli | grep ^wl.\*: | sed "s/wl.*: connected to //g")" ] "
	else
		nc=$(($nc+1))
fi


if [ $nc == "6" ]
	then
		echo "  [ No Connection ]  "
fi
