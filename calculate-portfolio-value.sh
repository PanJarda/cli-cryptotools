# usage:
# ./calculate-portfolio-value
# ./calculate-portfolio-value in eur

main_currency=${2:-czk}
sum=0

while read line
do
	converted=$(./convert $line to $main_currency)
	sum=`dc -e "3 k $sum $converted 1000000 / + p"`
done < portfolio

echo $sum  
echo `date -u +"%Y-%m-%dT%H:%M:%SZ"` $sum >> ${main_currency}.log
