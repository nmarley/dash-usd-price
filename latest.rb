require 'byebug'

$:.push('./lib')
require 'wavg/db'

polo = get_latest_poloniex
bits = get_latest_bitstamp
dash_usd = polo.last * bits.last

byebug

1

