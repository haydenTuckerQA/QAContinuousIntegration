echo 'Enter a number'
read NUMBER

if [ $((NUMBER%2)) -eq 0 ];
then
	echo "$NUMBER is even"
else
	echo "$NUMBER is odd"
fi
