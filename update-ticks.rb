require 'pp'
require 'byebug'

$:.push('./lib')
require 'wavg/www'
require 'wavg/db'

btc_dash = get_polo('BTC_DASH')
PoloniexTick.create(btc_dash)

btc_ltc = get_polo('BTC_LTC')
PoloniexBtcltcTick.create(btc_ltc)

bitstamp_tick = get_bitstamp_tick
BitstampTick.create(bitstamp_tick)
