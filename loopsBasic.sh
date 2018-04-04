X=1
echo 'Enter a number'
read INPUT
while [ $X -le $INPUT ]
do
	echo "$X"
	X=$((X + 1))
done
