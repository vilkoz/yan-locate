#!/usr/bin/sh
curl -i -s -k -X 'POST' \
-H 'User-Agent: Dalvik/2.1.0 (Linux; U; Android 5.0.1; Nexus 5 Build/LRX22C)' -H 'Content-Type: application/x-www-form-urlencoded' \
"http://mobile.maps.yandex.net/cellid_location/?clid=1866854&lac=-1&cellid=-1&operatorid=null&countrycode=null&signalstrength=-1&wifinetworks=$1:-65&app=ymetro" | grep '<?xml' -A5 > items.xml

is_found=$(cat items.xml | grep 'coordinates' | wc -l)
if [ "$is_found" = "1" ]; then
	python3 parse.py
	rm -f items.xml
else
	rm -f items.xml
	echo $(tput setaf 1)"NOT FOUND!"$(tput sgr0)
fi
