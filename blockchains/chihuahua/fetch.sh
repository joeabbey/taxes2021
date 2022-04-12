mkdir data; for i in $(seq 1 390); do echo $i of 390; chihuahuad q txs --events "message.sender=chihuahua1xwazl8ftks4gn00y5x3c47auquc62ssux7t58j" --page $i --limit 100 --output json > ./data/chihuahua1xwazl8ftks4gn00y5x3c47auquc62ssux7t58j.$(printf "$03d" $i).json; sl
eep 5; done
