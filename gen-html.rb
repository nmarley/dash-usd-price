require 'erb'
require 'byebug'

$:.push('./lib')
require 'wavg/db'

polo = get_latest_poloniex
bits = get_latest_bitstamp
btc_ltc = get_latest_polo_btc_ltc.last.to_f.round(8)

btc_usd = bits.last.to_f.round(8)
bits_ts = bits.ts

dash_btc = polo.last.to_f.round(8)
polo_ts = polo.created_at

dash_usd = (polo.last * bits.last).to_f.round(4)
last_page_gen = Time.now.getutc

path = 'dash-price.html.erb'
page = ERB.new(File.read(path)).result(binding)

File.open('dash-price.html', 'w') { |f| f.write(page) }
