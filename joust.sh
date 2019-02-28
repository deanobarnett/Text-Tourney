#!/bin/sh

playerOneHealth=1000
playerTwoHealth=1000

cat <<EOM
  _                 _   _             
 (_)               | | (_)            
  _  ___  _   _ ___| |_ _ _ __   __ _ 
 | |/ _ \| | | / __| __| | '_ \ / _  |
 | | (_) | |_| \__ \ |_| | | | | (_| |
 | |\___/ \__,_|___/\__|_|_| |_|\__, |
_/ |                             __/ |
|__/                             |___/
EOM

echo ""
echo "Enter the name of contestant number 1!"
read -r name1
echo "Welcome to the Joust $name1! Are you wearing your cup?"

echo "Enter the name of contestant number 2!"
read -r name2
echo "Ready your lance and shield $name2. The battle is about to begin!"

sleep 2

while  [ $playerOneHealth -ge 0 ] && [ $playerTwoHealth -ge 0 ]; do
	playerOneHit=$((RANDOM % 100))
	sleep 1
	playerTwoHit=$((RANDOM % 100))
	
	if [ "$playerOneHit" -gt "$playerTwoHit" ]
	then
		playerTwoHealth=$((playerTwoHealth - playerOneHit))
		
		echo "$name1 hit $name2 for $playerOneHit"
	elif [ "$playerTwoHit" -gt "$playerOneHit" ]
	then
		playerOneHealth=$((playerOneHealth - playerTwoHit))
		
		echo "$name2 hit $name1 for $playerTwoHit"
		
	else
		echo "Ohhh! Both parties have parried the attack!"
	fi
	
	echo "$name1 has $playerOneHealth hit points left"
	echo "$name2 has $playerTwoHealth hit points left"

	sleep 3
done

if [ $playerOneHealth -le 0 ]
then
	echo "$name2 is victorius! To the victor goes the spoils!"
else
	echo "$name1 is victorius! To the victor goes the spoils!"
fi
