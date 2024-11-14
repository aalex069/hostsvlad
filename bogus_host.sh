#!/bin/bash

nslookup $1 | while read linie; do
	if echo "$linie" | grep -q "Name:*"; then
		read address_line
		read label good_ip <<< "$address_line"
		if [ $2 != $good_ip ]; then
			echo "Bogus IP for $1 !"
		fi
		break
	fi
done