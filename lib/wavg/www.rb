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


def get_poloniex_tick
  resp = HTTParty.get(POLONIEX_TICKER)
  # resp = OpenStruct.new
  # resp.body = File.read('polo.json')
  fetch_time = Time.now.getutc

  h = JSON.parse(resp.body)
  tick = h['BTC_DASH']
  tick.each { |k,v| tick[k] = v.to_d }
  tick['created_at'] = fetch_time
  tick['updated_at'] = fetch_time
  tick = tick.to_snake_keys

  return tick
end

def get_bitstamp_tick
  resp = HTTParty.get(BITSTAMP_TICKER)
  # resp = OpenStruct.new
  # resp.body = File.read('bitstamp.json')
  fetch_time = Time.now.getutc

  tick = JSON.parse(resp.body)
  ts = Time.at( tick.delete('timestamp').to_i ).getutc
  tick.each { |k,v| tick[k] = v.to_d }
  tick['ts'] = ts
  tick['created_at'] = fetch_time
  tick['updated_at'] = fetch_time

  return tick
end
