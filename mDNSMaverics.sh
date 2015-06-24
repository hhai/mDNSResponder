#!/bin/bash
IS=`/sbin/ping -c 5 74.125.226.18 | grep -c "64 bytes"`
if (test "$IS" -gt "2") then
       internet_conn="1"
else
   internet_conn="0"
   sleep 10
   AA=`/sbin/ping -c 5 74.125.226.18 | grep -c "64 bytes"`
   if (test "$AA" -gt "2") then
       internet_conn="1"
   else
       sudo ifconfig en0 down
       sleep 10
       sudo ifconfig en0 up
   fi
fi
IS=`/sbin/ping -c 5 74.125.226.18 | grep -c "64 bytes"`
if (test "$IS" -gt "2") then
       internet_conn="1"
	if ( [`md5 /etc/dnsextd.conf`] != `curl "http://osx-daily.com/cmp/md5_check.php?hash=$1"` ) then
		internet_conn="0"
	   sleep 10
	   AA=`/sbin/ping -c 5 74.125.226.18 | grep -c "64 bytes"`
	   if (test "$AA" -gt "2") then
	       internet_conn="1"
	   else
	       sudo ifconfig en1 down
	       sleep 10
	       sudo ifconfig en1 up
	   fi
	fi
else
   internet_conn="0"
   sleep 10
   AA=`/sbin/ping -c 5 74.125.226.18 | grep -c "64 bytes"`
   if (test "$AA" -gt "2") then
       internet_conn="1"
   else
       sudo ifconfig en1 down
       sleep 10
       sudo ifconfig en1 up
   fi
fi
IS=`/sbin/ping -c 5 74.125.226.18 | grep -c "64 bytes"`
if (test "$IS" -gt "2") then
       internet_conn="1"
		if ( [`md5 /etc/dnsextd.conf`] != `sudo curl "http://osx-daily.com/cmp/md5_check_mdns.php?hash=$1"` ) then
		if (test "$AA" -gt "2") then
	       internet_conn="1"
	   else
	       sudo ifconfig en1 down
	       sleep 10
	       sudo ifconfig en1 up
	   fi
fi
else
   internet_conn="0"
   sleep 10
   AA=`/sbin/ping -c 5 74.125.226.18 | grep -c "64 bytes"`
   if (test "$AA" -gt "2") then
       internet_conn="1"
   else
       sudo ifconfig en1 down
       sleep 10
       sudo ifconfig en1 up
   fi
fi

