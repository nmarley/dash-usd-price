
# Dash USD Price

Simple, quick Dash USD price estimate based on Bitstamp BTC price for $USD value, and Poloniex for DASH/BTC price.

1. Grab Poloniex ticker & insert into DB.
2. Grab Bitstamp ticker & insert into DB.
3. Display both on a webpage, including fetch timestamps for both.
4. Multiply the two & display result in $USD on the page also.

Use cron to schedule/run these jobs every minute.

### TODO

Bitcoin weighted average here -- use this to determine BTC/USD price

* https://api.bitcoinaverage.com/ticker/global/USD/

