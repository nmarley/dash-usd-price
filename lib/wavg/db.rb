require 'sequel'
require 'date'
require 'time'
require 'bigdecimal'
require 'bigdecimal/util'

Sequel.application_timezone = :utc
Sequel.database_timezone = :utc
DB = Sequel.postgres('ticker', user: 'ticker')

class PoloniexTick < Sequel::Model(DB)
end

class PoloniexBtcltcTick < Sequel::Model(DB)
end

class BitstampTick < Sequel::Model(DB)
end

def get_latest_poloniex
  PoloniexTick.where(:created_at => PoloniexTick.max(:created_at)).first
end

def get_latest_polo_btc_ltc
  PoloniexBtcltcTick.where(:created_at => PoloniexBtcltcTick.max(:created_at)).first
end

def get_latest_bitstamp
  BitstampTick.where(:ts => BitstampTick.max(:ts)).first
end
