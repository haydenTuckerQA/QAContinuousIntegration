echo 'Enter your first number'
read NUMBER1

echo 'Enter your second number'
read NUMBER2

RESULT=$((NUMBER1 + NUMBER2))

if [ $((RESULT%2)) -eq 0 ];
then
	echo "$RESULT is even"
else
	echo "$RESULT is odd"
fi
