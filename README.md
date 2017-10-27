# cli-cryptotools
Useful bash scripts for cryptocurrency price monitoring.
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

## Usage example
```bash
./convert 10 bitcoin to eur
./convert 10 eur to bitcoin
./calculate-portfolio-value
./calculate-portfolio-value in eur
```
