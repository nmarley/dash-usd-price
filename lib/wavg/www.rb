require 'json'
require 'httparty'
require 'plissken'
require 'date'
require 'time'
require 'bigdecimal'
require 'bigdecimal/util'

require 'ostruct'

POLONIEX_TICKER = 'https://poloniex.com/public?command=returnTicker'
BITSTAMP_TICKER = 'https://www.bitstamp.net/api/ticker/'

def get_polo(market)
  resp = HTTParty.get(POLONIEX_TICKER)
  # resp = OpenStruct.new;resp.body = File.read('polo.json')

  h = JSON.parse(resp.body)
  tick = fmt_polo_market(h, market)
  return tick
end

def get_bitstamp_tick
  resp = HTTParty.get(BITSTAMP_TICKER)
  # resp = OpenStruct.new;resp.body = File.read('bitstamp.json')

  fetch_time = Time.now.getutc
  tick = JSON.parse(resp.body)
  ts = Time.at( tick.delete('timestamp').to_i ).getutc
  tick.each { |k,v| tick[k] = v.to_d }
  tick['ts'] = ts
  tick['created_at'] = fetch_time
  tick['updated_at'] = fetch_time

  return tick
end

#private :fmt_polo_market
def fmt_polo_market(hash, market)
  fetch_time = Time.now.getutc
  tick = hash[market]
  tick.each { |k,v| tick[k] = v.to_d }
  tick['created_at'] = fetch_time
  tick['updated_at'] = fetch_time
  tick = tick.to_snake_keys
end

