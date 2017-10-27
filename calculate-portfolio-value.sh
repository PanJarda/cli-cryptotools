# usage:
# ./calculate-portfolio-value
# ./calculate-portfolio-value in eur

main_currency=${2:-czk}
sum=0

while read line
do
	converted=$(./convert.sh $line to $main_currency)
	sum=`dc -e "$sum $converted + p"`
done < portfolio

echo $sum
