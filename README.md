# cli-cryptotools
Useful bash scripts for cryptocurrencies price monitoring.
## Dependencies
`brew install jq`
## Setup
For calculating your portfolio value you need to setup `portfolio` file in the same directory, from the script is run.

For example:
```
100 monero
10 bitcoin
1000 litecoin
123 ethereum
```

## Usage examples
Fiat currency is always abbreviation and cryptocurrency is always fullname. It uses coinmarketcap.com api, so the names of currencies can be found there: https://coinmarketcap.com/api/.
```bash
./convert 10 bitcoin to eur
./convert 10 eur to bitcoin
./calculate-portfolio-value
./calculate-portfolio-value in eur
```
