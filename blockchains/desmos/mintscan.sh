#!/bin/bash

URL="https://api-desmos.cosmostation.io/v1/account/new_txs/"
ADDRESS="desmos1xwazl8ftks4gn00y5x3c47auquc62ssu3nt23g"
LIMIT=50
FROM=124104
CONTINUE=0
FY2021END="$(date "+%s" --date="2022-01-01T00:00:00Z")"
while [ $CONTINUE -eq 0 ] ; do
	echo $FROM
	DATA="$(curl -fsSL "$URL/$ADDRESS?limit=$LIMIT&from=$FROM")"
	if [ -z "$DATA" ]; then
		CONTINUE=1;
		continue
	fi
	TIMESTAMP="$(date "+%s" --date="$(echo $DATA | jq -r '.[-1].header.timestamp')")"
	if [ $TIMESTAMP -lt $FY2021END ]; then
		echo $DATA > $ADDRESS.$(printf "%06d" $FROM).json
	fi
	FROM="$(echo $DATA | jq -r '.[-1].header.id')"
	sleep 5
done

