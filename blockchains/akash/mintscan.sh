#!/bin/bash

URL="https://api-akash.cosmostation.io/v1/account/new_txs/"
ADDRESS="akash1xwazl8ftks4gn00y5x3c47auquc62ssugstal2"
LIMIT=50
FROM=0
CONTINUE=0
FY2021END="$(date "+%s" --date="2022-01-01T00:00:00Z")"
while [ $CONTINUE -eq 0 ] ; do
	echo $FROM
	curl -fsSL "$URL/$ADDRESS?limit=$LIMIT&from=$FROM" > data.json
	if [ -z "$(wc -c data.json)" ]; then
		CONTINUE=1;
		continue
	fi
	TIMESTAMP="$(date "+%s" --date="$(jq -r '.[-1].header.timestamp' data.json)")"
	if [ $TIMESTAMP -lt $FY2021END ]; then
		cp data.json ./data/$ADDRESS.$(printf "%08d" $FROM).json
	fi
	FROM="$(jq -r '.[-1].header.id' data.json)"
	sleep 5
done

