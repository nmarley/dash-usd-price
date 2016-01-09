require 'pp'
require 'byebug'

$:.push('./lib')
require 'wavg/www'
require 'wavg/db'

poloniex_tick = get_poloniex_tick
PoloniexTick.create(poloniex_tick)

bitstamp_tick = get_bitstamp_tick
BitstampTick.create(bitstamp_tick)
