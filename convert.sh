# example:
# ./convert 20000 czk to litecoin
# ./convert 0.4 monero to czk
# need to install jq (on macos via brew)

AVAILABLE_FIAT="aud brl cad chf clp cny czk dkk eur gbp hkd huf idr ils inr jpy krw mxn myr nok nzd php pkr pln rub sek sgd thb try twd zar"

function contains() {
	for i in $1
	do
		if [ "$i" == "$2" ]
		then
			return 0
		fi
	done

	return 1
}

function get_price() {
	local cryptcurrency=${1:-bitcoin}
	local currency_to_convert=${2:-czk}
	local api_URL="https://api.coinmarketcap.com/v1/ticker/$cryptcurrency/?convert=$currency_to_convert"

	curl $api_URL 2>/dev/null |\
		jq -c -r ".[0].price_$currency_to_convert"
}

amount=${1:-1}
from=${2:-bitcoin}
to=${4:-CZK}

if contains "$AVAILABLE_FIAT" "$from"
then
	price_for_one=$(get_price $to $from)
	price_for_one=`dc -e "10k 1 $price_for_one / p"`
else
	price_for_one=$(get_price $from $to)
fi

dc -e "$amount $price_for_one * p"
