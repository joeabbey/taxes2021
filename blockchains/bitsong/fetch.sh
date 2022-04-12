#!/bin/bash

ADDRESS="bitsong1xwazl8ftks4gn00y5x3c47auquc62ssufz5jyl"
LCD_URL="https://lcd.explorebitsong.com"
FIRST=1
LAST=5
LIMIT=20

mkdir data

for i in $(seq $FIRST $LAST); do
	printf "Fetching page %02d of %02d\n" "$i" "$LAST";
	curl -fsSL "$LCD_URL/txs?message.sender=$ADDRESS&page=$i&limit=$LIMIT" > "./data/$ADDRESS.$(printf "%02d" $i).json";
	sleep 5;
done
