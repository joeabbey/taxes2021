#!/bin/bash

ADDRESS="bostrom1xwazl8ftks4gn00y5x3c47auquc62ssuxcjfch"
LCD_URL="https://lcd.bostrom.cybernode.ai"
FIRST=1
LAST=19

mkdir data

for i in $(seq $FIRST $LAST); do
	printf "Fetching page %02d of %02d\n" "$i" "$LAST";
	curl -fsSL "$LCD_URL/txs?message.sender=$ADDRESS&page=$i&limit=100" > "./data/$ADDRESS.$(printf "%02d" $i).json";
	sleep 5;
done
